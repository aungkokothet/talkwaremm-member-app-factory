import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/routing/app_route.dart';
import 'package:profile_challenge_app/app/features/auth/binding/auth_binding.dart';
import 'package:profile_challenge_app/app/features/auth/screen/sign_in_screen.dart';
import 'package:profile_challenge_app/app/features/profile/binding/profile_binding.dart';
import 'package:profile_challenge_app/app/features/profile/screen/profile_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signIn;

  static final routes = [
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
