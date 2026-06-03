class GoogleSignInConfig {
  GoogleSignInConfig._();

  static const List<String> classroomScopes = [
    'https://www.googleapis.com/auth/classroom.courses.readonly',
    'https://www.googleapis.com/auth/classroom.student-submissions.me.readonly',
    'https://www.googleapis.com/auth/classroom.announcements.readonly',
  ];

  static const String _clientId = String.fromEnvironment('GOOGLE_CLIENT_ID');
  static const String _serverClientId = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
  );
  static const String _defaultWebServerClientId =
      '448940602292-6lm99mgajvtrfinhqv8dkop6erof0e10.apps.googleusercontent.com';

  // Android OAuth clients are configured in Google Cloud with package name
  // and SHA-1 fingerprints; Android client IDs are not passed here.
  //
  // Without google-services.json, google_sign_in on Android needs a Web OAuth
  // client ID as serverClientId. Do not use the Android OAuth client ID as a
  // fake serverClientId.
  // Do not put the Android OAuth client ID in that value.
  static String? get clientId => _clientId.isEmpty ? null : _clientId;

  static String? get serverClientId =>
      _serverClientId.isEmpty ? _defaultWebServerClientId : _serverClientId;
}
