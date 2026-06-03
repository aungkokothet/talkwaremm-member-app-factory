import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';

abstract class AuthService {
  Future<AppIdentity?> signIn();

  Future<void> signOut();
}
