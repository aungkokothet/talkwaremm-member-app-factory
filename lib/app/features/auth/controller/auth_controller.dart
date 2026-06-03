import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/constant/routing/app_route.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/auth/model/auth_failure.dart';
import 'package:profile_challenge_app/app/features/auth/service/auth_service.dart';

class AuthController extends BaseController {
  AuthController({AuthService? authService})
    : _authService = authService ?? Get.find<AuthService>();

  final AuthService _authService;
  final Rxn<AppIdentity> identity = Rxn<AppIdentity>();

  bool get isSignedIn => identity.value != null;

  Future<void> signInAndOpenProfile() async {
    showLoading();

    try {
      final signedInIdentity = await _authService.signIn();

      if (signedInIdentity == null) {
        showMessage(AppString.signInCanceledMessage);
        return;
      }

      identity.value = signedInIdentity;
      Get.offNamed(Routes.profileScreen);
    } on AuthFailure catch (error) {
      showMessage(error.message);
      Get.snackbar(AppString.signInErrorTitle, error.message);
    } catch (error) {
      final message = '${AppString.signInErrorMessage} $error';
      showMessage(message);
      Get.snackbar(AppString.signInErrorTitle, message);
    } finally {
      hideLoading();
    }
  }

  Future<void> signOut() async {
    showLoading();

    try {
      await _authService.signOut();
    } finally {
      hideLoading();
    }

    identity.value = null;
  }

  Future<void> signOutAndReturnToSignIn() async {
    await signOut();
    Get.offAllNamed(Routes.signIn);
  }
}
