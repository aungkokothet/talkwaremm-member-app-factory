import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/auth/controller/auth_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/member/controller/member_controller.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => ClassroomController(), fenix: true);
    Get.lazyPut(() => MemberController(), fenix: true);
  }
}
