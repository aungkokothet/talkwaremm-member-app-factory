import 'package:get/get.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';

class ClassroomController extends BaseController {
  final Rx<ClassroomContext> context = const ClassroomContext(
    courseName: 'Talkware Builder Training',
    assignmentTitle: 'Week 2 Member App Foundation',
    assignmentStatus: 'Ready to start',
  ).obs;
}
