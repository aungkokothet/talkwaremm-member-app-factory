class GoogleSignInConfig {
  GoogleSignInConfig._();

  static const String _clientId = String.fromEnvironment('GOOGLE_CLIENT_ID');
  static const String _serverClientId = String.fromEnvironment(
    'GOOGLE_SERVER_CLIENT_ID',
  );
  static const String _defaultWebServerClientId =
      '448940602292-6lm99mgajvtrfinhqv8dkop6erof0e10.apps.googleusercontent.com';

  // Android OAuth client IDs are registered in Google Cloud with package name
  // and SHA fingerprints; they are not passed here as serverClientId.
  //
  // If Android is configured without google-services.json, google_sign_in
  // requires the Web OAuth client ID as GOOGLE_SERVER_CLIENT_ID.
  // Do not put the Android OAuth client ID in that value.
  static String? get clientId => _clientId.isEmpty ? null : _clientId;

  static String? get serverClientId =>
      _serverClientId.isEmpty ? _defaultWebServerClientId : _serverClientId;
}
