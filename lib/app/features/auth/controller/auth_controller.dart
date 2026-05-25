import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/constant/routing/app_route.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/mock_google_identity.dart';

class AuthController extends BaseController {
  static const MockGoogleIdentity mockIdentity = MockGoogleIdentity(
    fullName: AppString.mockMemberFullName,
    email: AppString.mockMemberEmail,
    photoInitials: AppString.mockMemberPhotoInitials,
    photoAssetPath: AppString.mockMemberPhotoAsset,
  );

  final Rxn<MockGoogleIdentity> identity = Rxn<MockGoogleIdentity>();

  bool get isSignedIn => identity.value != null;

  void signInWithMockGoogle() {
    identity.value = mockIdentity;
  }

  void signInAndOpenProfile() {
    signInWithMockGoogle();
    Get.offNamed(Routes.profileScreen);
  }

  void signOut() {
    identity.value = null;
  }

  void signOutAndReturnToSignIn() {
    signOut();
    Get.offAllNamed(Routes.signIn);
  }
}
