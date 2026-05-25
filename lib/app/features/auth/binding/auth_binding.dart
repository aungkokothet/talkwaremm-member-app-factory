import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut(() => AuthController(), fenix: true);
    }
  }
}
