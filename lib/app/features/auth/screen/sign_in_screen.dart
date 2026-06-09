import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/design/talkware_radius.dart';
import 'package:profile_challenge_app/app/design/talkware_spacing.dart';
import 'package:profile_challenge_app/app/design/widgets/talkware_logo.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';

class SignInScreen extends BaseView<AuthController> {
  const SignInScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.signInHorizontalPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: AppDimens.signInMaxWidth,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: TalkwareSpacing.xl),
                          _SignInContent(
                            controller: controller,
                            onSignIn: controller.signInAndOpenProfile,
                          ),
                          const Spacer(),
                          const _SignInFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SignInContent extends StatelessWidget {
  const _SignInContent({required this.controller, required this.onSignIn});

  final AuthController controller;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(TalkwareSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _BrandingBlock(),
            const SizedBox(height: TalkwareSpacing.lg),
            Text(
              AppString.signInTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: TalkwareSpacing.xs),
            Text(
              AppString.signInSubtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: TalkwareSpacing.lg),
            Obx(() {
              final isLoading = controller.isLoading.value;
              final message = controller.message.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _GoogleSignInButton(
                    isLoading: isLoading,
                    onPressed: isLoading ? null : onSignIn,
                  ),
                  if (message.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: TalkwareSpacing.sm),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _BrandingBlock extends StatelessWidget {
  const _BrandingBlock();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(TalkwareSpacing.xs),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withValues(alpha: 0.65),
            borderRadius: BorderRadius.circular(TalkwareRadius.lg),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: const TalkwareLogo(size: 56),
        ),
        const SizedBox(height: TalkwareSpacing.sm),
        Text(
          AppString.signInBrandName,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TalkwareRadius.md),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppDimens.signInProviderIconSize,
              height: AppDimens.signInProviderIconSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                border: Border.all(color: colorScheme.onPrimary),
                shape: BoxShape.circle,
              ),
              child: Text(
                'G',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: TalkwareSpacing.sm),
            Flexible(
              child: Text(
                isLoading
                    ? AppString.signInLoadingLabel
                    : AppString.signInWithGoogle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInFooter extends StatelessWidget {
  const _SignInFooter();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.itemGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextButton(
              onPressed: () {},
              child: const FittedBox(child: Text(AppString.termsOfService)),
            ),
          ),
          Flexible(
            child: TextButton(
              onPressed: () {},
              child: const FittedBox(child: Text(AppString.privacyPolicy)),
            ),
          ),
        ],
      ),
    );
  }
}
