import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/design/talkware_radius.dart';
import 'package:profile_challenge_app/app/design/talkware_spacing.dart';
import 'package:profile_challenge_app/app/design/widgets/talkware_app_bar.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';
import 'package:profile_challenge_app/app/features/profile/controller/profile_controller.dart';
import 'package:profile_challenge_app/app/widget/member_app_drawer.dart';
import 'package:profile_challenge_app/app/widget/section_card.dart';

class ProfileScreen extends BaseView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    final authController = Get.find<AuthController>();
    final classroomController = Get.find<ClassroomController>();
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: TalkwareAppBar(
        onMenuPressed: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      endDrawer: MemberAppDrawer(authController: authController),
      body: SafeArea(
        child: Obx(() {
          final identity = authController.identity.value;
          final classroom = classroomController.context.value;

          if (identity == null) {
            classroomController.reset();
          } else {
            unawaited(classroomController.loadTalkwareCourse(identity));
          }

          return ListView(
            padding: const EdgeInsets.all(TalkwareSpacing.lg),
            children: [
              if (identity == null)
                _SignedOutCard(onSignIn: authController.signInAndOpenProfile)
              else
                _MemberLearningHeader(identity: identity),
              const SizedBox(height: TalkwareSpacing.sm),
              SectionCard(
                title: AppString.classroomTitle,
                child: _ClassroomContextCard(
                  classroom: classroom,
                  isLoading: classroomController.isLoading.value,
                  message: classroomController.message.value,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _SignedOutCard extends StatelessWidget {
  const _SignedOutCard({required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: AppString.profileTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppString.signedOutMessage),
          const SizedBox(height: TalkwareSpacing.sm),
          FilledButton.icon(
            onPressed: onSignIn,
            icon: const Icon(Icons.login_outlined),
            label: const Text(AppString.signInWithGoogle),
          ),
        ],
      ),
    );
  }
}

class _MemberLearningHeader extends StatelessWidget {
  const _MemberLearningHeader({required this.identity});

  final AppIdentity identity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(TalkwareSpacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(TalkwareRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IdentityAvatar(
            identity: identity,
            size: AppDimens.profileHeaderAvatarSize,
          ),
          const SizedBox(height: TalkwareSpacing.sm),
          Text(
            identity.fullName,
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: TalkwareSpacing.xs),
          Text(
            identity.email,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _IdentityAvatar extends StatelessWidget {
  const _IdentityAvatar({required this.identity, required this.size});

  final AppIdentity identity;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final photoUrl = identity.photoUrl;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: photoUrl == null || photoUrl.isEmpty
          ? Center(
              child: Text(
                identity.initials,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: colorScheme.primary),
              ),
            )
          : Image.network(
              photoUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    identity.initials,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _ClassroomContextCard extends StatelessWidget {
  const _ClassroomContextCard({
    required this.classroom,
    required this.isLoading,
    required this.message,
  });

  final ClassroomContext? classroom;
  final bool isLoading;
  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final classroom = this.classroom;

    if (isLoading) {
      return const Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: TalkwareSpacing.sm),
          Expanded(child: Text(AppString.classroomLoadingMessage)),
        ],
      );
    }

    if (message.isNotEmpty) {
      return Text(
        message,
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
      );
    }

    if (classroom == null) {
      return const Text(AppString.classroomLoadingMessage);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(classroom.courseName, style: textTheme.bodyLarge),
        if (classroom.courseDetails != null) ...[
          const SizedBox(height: TalkwareSpacing.xs),
          Text(classroom.courseDetails!),
        ],
        if (classroom.courseWorkTitle != null) ...[
          const SizedBox(height: TalkwareSpacing.sm),
          Text(AppString.classroomCourseWorkLabel, style: textTheme.labelLarge),
          const SizedBox(height: TalkwareSpacing.xs),
          Text(classroom.courseWorkTitle!),
        ],
        if (classroom.announcementText != null) ...[
          const SizedBox(height: TalkwareSpacing.sm),
          Text(
            AppString.classroomAnnouncementLabel,
            style: textTheme.labelLarge,
          ),
          const SizedBox(height: TalkwareSpacing.xs),
          Text(classroom.announcementText!),
        ],
      ],
    );
  }
}
