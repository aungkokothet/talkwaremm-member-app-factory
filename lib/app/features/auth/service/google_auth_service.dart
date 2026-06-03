import 'package:google_sign_in/google_sign_in.dart';
import 'package:profile_challenge_app/app/constant/config/google_sign_in_config.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/features/auth/model/auth_failure.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/auth/service/auth_service.dart';

class GoogleAuthService implements AuthService {
  GoogleAuthService({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final GoogleSignIn _googleSignIn;
  bool _isInitialized = false;

  Future<void> _initialize() async {
    if (_isInitialized) {
      return;
    }

    await _googleSignIn.initialize(
      clientId: GoogleSignInConfig.clientId,
      serverClientId: GoogleSignInConfig.serverClientId,
    );
    _isInitialized = true;
  }

  @override
  Future<AppIdentity?> restoreSession() async {
    await _initialize();

    final authentication = _googleSignIn.attemptLightweightAuthentication();
    final account = await authentication;

    if (account == null) {
      return null;
    }

    return AppIdentity.fromGoogleAccount(
      account,
      classroomAuthHeaders: await account.authorizationClient
          .authorizationHeaders(GoogleSignInConfig.classroomScopes),
    );
  }

  @override
  Future<AppIdentity?> signIn() async {
    await _initialize();

    if (!_googleSignIn.supportsAuthenticate()) {
      throw const AuthFailure(AppString.googleSignInUnsupportedMessage);
    }

    try {
      final account = await _googleSignIn.authenticate();
      return AppIdentity.fromGoogleAccount(
        account,
        classroomAuthHeaders: await account.authorizationClient
            .authorizationHeaders(
              GoogleSignInConfig.classroomScopes,
              promptIfNecessary: true,
            ),
      );
    } on GoogleSignInException catch (error) {
      switch (error.code) {
        case GoogleSignInExceptionCode.canceled:
        case GoogleSignInExceptionCode.interrupted:
        case GoogleSignInExceptionCode.uiUnavailable:
          return null;
        case GoogleSignInExceptionCode.clientConfigurationError:
        case GoogleSignInExceptionCode.providerConfigurationError:
        case GoogleSignInExceptionCode.userMismatch:
        case GoogleSignInExceptionCode.unknownError:
          throw AuthFailure(
            '${AppString.signInErrorMessage} '
            '${AppString.googleSignInErrorPrefix}${error.code.name}'
            '${error.description == null ? '' : ': ${error.description}'}',
          );
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _initialize();
    await _googleSignIn.signOut();
  }
}
