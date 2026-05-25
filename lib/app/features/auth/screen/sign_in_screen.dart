import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_challenge_app/app/constant/resources/app_colors.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_images.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
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
                          const SizedBox(height: AppDimens.sectionGap),
                          _SignInContent(
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
  const _SignInContent({required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _BrandingBlock(),
        const SizedBox(height: AppDimens.sectionGap),
        Text(
          AppString.signInTitle,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: AppDimens.itemGap),
        Text(
          AppString.signInSubtitle,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppDimens.sectionGap),
        _GoogleSignInButton(onPressed: onSignIn),
      ],
    );
  }
}

class _BrandingBlock extends StatelessWidget {
  const _BrandingBlock();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SvgPicture.asset(
          AppImages.logo,
          width: AppDimens.signInLogoSize,
          height: AppDimens.signInLogoSize,
        ),
        const SizedBox(height: AppDimens.itemGap),
        Text(AppString.signInBrandName, style: textTheme.titleLarge),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.signInButtonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          backgroundColor: AppColors.surface,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.cardRadius),
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
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                shape: BoxShape.circle,
              ),
              child: Text(
                'G',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: AppDimens.itemGap),
            const Text(AppString.signInWithGoogle),
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
