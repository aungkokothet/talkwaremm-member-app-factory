import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_colors.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/member/controller/member_controller.dart';
import 'package:profile_challenge_app/app/widget/section_card.dart';

class MemberDashboardScreen extends BaseView<MemberController> {
  const MemberDashboardScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    final authController = Get.find<AuthController>();
    final classroomController = Get.find<ClassroomController>();

    return Scaffold(
      appBar: AppBar(title: const Text(AppString.memberDashboardTitle)),
      body: SafeArea(
        child: Obx(() {
          final identity = authController.identity.value;
          final memberStatus = controller.status.value;
          final classroom = classroomController.context.value;

          return ListView(
            padding: const EdgeInsets.all(AppDimens.screenPadding),
            children: [
              if (identity == null)
                _SignedOutCard(onSignIn: authController.signInWithMockGoogle)
              else
                _MemberHeader(
                  initials: identity.photoInitials,
                  name: identity.displayName,
                  email: identity.email,
                  onSignOut: authController.signOut,
                ),
              const SizedBox(height: AppDimens.itemGap),
              SectionCard(
                title: AppString.memberStatusTitle,
                child: _StatusBadge(
                  label: memberStatus.label,
                  description: memberStatus.description,
                ),
              ),
              const SizedBox(height: AppDimens.itemGap),
              SectionCard(
                title: AppString.classroomTitle,
                child: _ClassroomCard(
                  courseName: classroom.courseName,
                  assignmentTitle: classroom.assignmentTitle,
                  assignmentStatus: classroom.assignmentStatus,
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
      title: AppString.memberDashboardTitle,
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

class _MemberHeader extends StatelessWidget {
  const _MemberHeader({
    required this.initials,
    required this.name,
    required this.email,
    required this.onSignOut,
  });

  final String initials;
  final String name;
  final String email;
  final VoidCallback onSignOut;

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
          CircleAvatar(
            radius: AppDimens.avatarSize / 4,
            backgroundColor: AppColors.surface,
            child: Text(
              initials,
              style: textTheme.titleLarge?.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: AppDimens.itemGap),
          Text(
            name,
            style: textTheme.headlineMedium?.copyWith(color: AppColors.surface),
          ),
          const SizedBox(height: AppDimens.itemGap / 2),
          Text(
            email,
            style: textTheme.bodyLarge?.copyWith(color: AppColors.surface),
          ),
          const SizedBox(height: AppDimens.itemGap),
          OutlinedButton.icon(
            onPressed: onSignOut,
            icon: const Icon(Icons.logout_outlined),
            label: const Text(AppString.signOut),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.surface,
              side: const BorderSide(color: AppColors.surface),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.description});

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(
          avatar: const Icon(Icons.verified_outlined, size: 18),
          label: Text(label),
          backgroundColor: AppColors.accent.withValues(alpha: 0.24),
          side: BorderSide.none,
        ),
        const SizedBox(height: AppDimens.itemGap),
        Text(description),
      ],
    );
  }
}

class _ClassroomCard extends StatelessWidget {
  const _ClassroomCard({
    required this.courseName,
    required this.assignmentTitle,
    required this.assignmentStatus,
  });

  final String courseName;
  final String assignmentTitle;
  final String assignmentStatus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(courseName, style: textTheme.bodyLarge),
        const SizedBox(height: AppDimens.itemGap),
        Text(assignmentTitle),
        const SizedBox(height: AppDimens.itemGap / 2),
        Text(assignmentStatus, style: textTheme.bodyMedium),
      ],
    );
  }
}
