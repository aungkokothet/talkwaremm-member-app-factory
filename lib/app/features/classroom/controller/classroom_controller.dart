import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_context.dart';
import 'package:profile_challenge_app/app/features/classroom/model/classroom_failure.dart';
import 'package:profile_challenge_app/app/features/classroom/service/classroom_service.dart';

class ClassroomController extends BaseController {
  ClassroomController({ClassroomService? classroomService})
    : _classroomService = classroomService ?? Get.find<ClassroomService>();

  final ClassroomService _classroomService;
  final Rxn<ClassroomContext> context = Rxn<ClassroomContext>();
  String? _loadedForEmail;

  Future<void> loadTalkwareCourse(AppIdentity identity) async {
    if (_loadedForEmail == identity.email) {
      return;
    }

    final authHeaders = identity.classroomAuthHeaders;

    _loadedForEmail = identity.email;
    showLoading();

    if (authHeaders == null || authHeaders['Authorization'] == null) {
      showMessage(AppString.classroomPermissionNotGranted);
      context.value = null;
      hideLoading();
      return;
    }

    try {
      context.value = await _classroomService.fetchTalkwareCourse(
        authHeaders: authHeaders,
      );
      showMessage('');
    } on ClassroomFailure catch (error) {
      context.value = null;
      showMessage(error.message);
    } catch (_) {
      context.value = null;
      showMessage(AppString.classroomTemporaryUnavailable);
    } finally {
      hideLoading();
    }
  }

  void reset() {
    if (_loadedForEmail == null && context.value == null && message.isEmpty) {
      return;
    }

    _loadedForEmail = null;
    context.value = null;
    showMessage('');
  }
}
