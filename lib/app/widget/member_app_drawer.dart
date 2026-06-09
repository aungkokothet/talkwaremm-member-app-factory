import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/constant/routing/app_route.dart';
import 'package:profile_challenge_app/app/design/talkware_spacing.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';

class MemberAppDrawer extends StatelessWidget {
  const MemberAppDrawer({super.key, required this.authController});

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
              if (identity != null) _MemberDrawerHeader(identity: identity),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text(AppString.profileMenuTitle),
                selected: Get.currentRoute == Routes.profileScreen,
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.profileScreen);
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: const Text(AppString.walletMenuTitle),
                selected: Get.currentRoute == Routes.wallet,
                onTap: () {
                  Get.back();
                  if (Get.currentRoute != Routes.wallet) {
                    Get.toNamed(Routes.wallet);
                  }
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

class _MemberDrawerHeader extends StatelessWidget {
  const _MemberDrawerHeader({required this.identity});

  final AppIdentity identity;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _IdentityAvatar(identity: identity, size: AppDimens.drawerAvatarSize),
          const SizedBox(height: TalkwareSpacing.sm),
          Text(
            identity.fullName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: TalkwareSpacing.xs),
          Text(identity.email, style: Theme.of(context).textTheme.bodyMedium),
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
