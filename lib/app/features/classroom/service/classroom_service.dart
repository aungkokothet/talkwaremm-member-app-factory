import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';

abstract class ClassroomService {
  Future<ClassroomContext> fetchTalkwareCourse({
    required Map<String, String> authHeaders,
  });
}
