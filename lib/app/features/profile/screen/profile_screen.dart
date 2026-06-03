import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_colors.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_images.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/constant/routing/app_route.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';
import 'package:profile_challenge_app/app/features/member/controller/member_controller.dart';
import 'package:profile_challenge_app/app/features/member/model/member_status.dart';
import 'package:profile_challenge_app/app/features/profile/controller/profile_controller.dart';
import 'package:profile_challenge_app/app/widget/section_card.dart';

class ProfileScreen extends BaseView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    final authController = Get.find<AuthController>();
    final memberController = Get.find<MemberController>();
    final classroomController = Get.find<ClassroomController>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(AppImages.logo, width: 36, height: 36),
          ),
        ],
      ),
      drawer: _ProfileDrawer(authController: authController),
      body: SafeArea(
        child: Obx(() {
          final identity = authController.identity.value;
          final memberStatus = memberController.status.value;
          final classroom = classroomController.context.value;

          if (identity == null) {
            classroomController.reset();
          } else {
            unawaited(classroomController.loadTalkwareCourse(identity));
          }

          return ListView(
            padding: const EdgeInsets.all(AppDimens.screenPadding),
            children: [
              if (identity == null)
                _SignedOutCard(onSignIn: authController.signInAndOpenProfile)
              else
                _MemberLearningHeader(identity: identity),
              const SizedBox(height: AppDimens.itemGap),
              SectionCard(
                title: AppString.memberStatusTitle,
                child: _StatusBadge(status: memberStatus),
              ),
              const SizedBox(height: AppDimens.itemGap),
              SectionCard(
                title: AppString.classroomTitle,
                child: _ClassroomContextCard(
                  classroom: classroom,
                  isLoading: classroomController.isLoading.value,
                  message: classroomController.message.value,
                ),
              ),
              const SizedBox(height: AppDimens.itemGap),
              const SectionCard(
                title: AppString.pointsTitle,
                child: Text(AppString.pointsPlaceholder),
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
          const SizedBox(height: AppDimens.itemGap),
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

    return Container(
      padding: const EdgeInsets.all(AppDimens.screenPadding),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimens.cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IdentityAvatar(
            identity: identity,
            size: AppDimens.profileHeaderAvatarSize,
          ),
          const SizedBox(height: AppDimens.itemGap),
          Text(
            identity.fullName,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.surface),
          ),
          const SizedBox(height: AppDimens.itemGap / 2),
          Text(
            identity.email,
            style: textTheme.bodyLarge?.copyWith(color: AppColors.surface),
          ),
        ],
      ),
    );
  }
}

class _ProfileDrawer extends StatelessWidget {
  const _ProfileDrawer({required this.authController});

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Obx(() {
          final identity = authController.identity.value;

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              if (identity != null)
                DrawerHeader(
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _IdentityAvatar(
                        identity: identity,
                        size: AppDimens.drawerAvatarSize,
                      ),
                      const SizedBox(height: AppDimens.itemGap),
                      Text(
                        identity.fullName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppDimens.itemGap / 2),
                      Text(
                        identity.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text(AppString.profileMenuTitle),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.profileScreen);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text(AppString.signOut),
                onTap: authController.signOutAndReturnToSignIn,
              ),
            ],
          );
        }),
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
    final photoUrl = identity.photoUrl;

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: photoUrl == null || photoUrl.isEmpty
          ? Center(
              child: Text(
                identity.initials,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
              ),
            )
          : Image.network(
              photoUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    identity.initials,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.primary),
                  ),
                );
              },
            ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final MemberStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          avatar: const Icon(Icons.verified_outlined, size: 18),
          label: Text(status.label),
          backgroundColor: AppColors.accent.withValues(alpha: 0.24),
          side: BorderSide.none,
        ),
        const SizedBox(height: AppDimens.itemGap),
        Text(status.description),
      ],
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
    final classroom = this.classroom;

    if (isLoading) {
      return const Row(
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: AppDimens.itemGap),
          Expanded(child: Text(AppString.classroomLoadingMessage)),
        ],
      );
    }

    if (message.isNotEmpty) {
      return Text(
        message,
        style: textTheme.bodyMedium?.copyWith(color: AppColors.secondary),
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
          const SizedBox(height: AppDimens.itemGap / 2),
          Text(classroom.courseDetails!),
        ],
        if (classroom.courseWorkTitle != null) ...[
          const SizedBox(height: AppDimens.itemGap),
          Text(AppString.classroomCourseWorkLabel, style: textTheme.labelLarge),
          const SizedBox(height: AppDimens.itemGap / 2),
          Text(classroom.courseWorkTitle!),
        ],
        if (classroom.announcementText != null) ...[
          const SizedBox(height: AppDimens.itemGap),
          Text(
            AppString.classroomAnnouncementLabel,
            style: textTheme.labelLarge,
          ),
          const SizedBox(height: AppDimens.itemGap / 2),
          Text(classroom.announcementText!),
        ],
      ],
    );
  }
}
