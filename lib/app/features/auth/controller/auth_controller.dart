import 'package:get/get.dart';
import 'package:profile_challenge_app/app/core/base/base_controller.dart';
import 'package:profile_challenge_app/app/features/auth/model/mock_google_identity.dart';

class AuthController extends BaseController {
  final Rxn<MockGoogleIdentity> identity = Rxn<MockGoogleIdentity>();

  bool get isSignedIn => identity.value != null;

  void signInWithMockGoogle() {
    identity.value = const MockGoogleIdentity(
      displayName: 'Maya Chen',
      email: 'maya.chen@example.com',
      photoInitials: 'MC',
    );
  }

  void signOut() {
    identity.value = null;
  }
}
