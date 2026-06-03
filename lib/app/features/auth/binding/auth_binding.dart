import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/auth/service/auth_service.dart';
import 'package:profile_challenge_app/app/features/auth/service/google_auth_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthService>()) {
      Get.lazyPut<AuthService>(() => GoogleAuthService(), fenix: true);
    }
    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut(() => AuthController(), fenix: true);
    }
  }
}
