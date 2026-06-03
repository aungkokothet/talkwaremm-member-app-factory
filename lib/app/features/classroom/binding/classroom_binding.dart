import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/service/classroom_service.dart';
import 'package:profile_challenge_app/app/features/classroom/service/google_classroom_service.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<ClassroomService>()) {
      Get.lazyPut<ClassroomService>(
        () => GoogleClassroomService(),
        fenix: true,
      );
    }
    Get.lazyPut(() => ClassroomController(), fenix: true);
  }
}
