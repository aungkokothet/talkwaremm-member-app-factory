import 'package:get/get.dart';
import 'package:profile_challenge_app/app/features/classroom/controller/classroom_controller.dart';

class ClassroomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassroomController(), fenix: true);
  }
}
