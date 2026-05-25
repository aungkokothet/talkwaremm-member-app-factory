import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_challenge_app/app/constant/resources/app_dimens.dart';
import 'package:profile_challenge_app/app/constant/resources/app_images.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_view.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/widget/section_card.dart';

class SignInScreen extends BaseView<AuthController> {
  const SignInScreen({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppDimens.screenPadding),
          children: [
            const SizedBox(height: AppDimens.itemGap),
            Center(
              child: SvgPicture.asset(AppImages.logo, width: 88, height: 88),
            ),
            const SizedBox(height: AppDimens.itemGap),
            SectionCard(
              title: AppString.signInTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppString.signedOutMessage),
                  const SizedBox(height: AppDimens.itemGap),
                  FilledButton.icon(
                    onPressed: controller.signInAndOpenProfile,
                    icon: const Icon(Icons.login_outlined),
                    label: const Text(AppString.signInWithGoogle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
