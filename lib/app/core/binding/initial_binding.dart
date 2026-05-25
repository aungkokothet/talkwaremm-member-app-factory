import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
