import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/auth/service/auth_service.dart';
import 'package:profile_challenge_app/app/features/auth/service/google_auth_service.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/service/classroom_service.dart';
import 'package:profile_challenge_app/app/features/classroom/service/google_classroom_service.dart';
import 'package:profile_challenge_app/app/features/member/controller/member_controller.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthService>()) {
      Get.lazyPut<AuthService>(() => GoogleAuthService(), fenix: true);
    }
    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut(() => AuthController(), fenix: true);
    }
    if (!Get.isRegistered<ClassroomService>()) {
      Get.lazyPut<ClassroomService>(
        () => GoogleClassroomService(),
        fenix: true,
      );
    }
    Get.lazyPut(() => ClassroomController(), fenix: true);
    Get.lazyPut(() => MemberController(), fenix: true);
  }
}
