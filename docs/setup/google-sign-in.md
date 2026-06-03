# Google Sign-In Setup Notes

Real Google Sign-In is implemented in the Flutter auth boundary. The current controlled target is Android only.

Do not commit secrets. OAuth client IDs are not secrets, but project-specific values should still be kept isolated in Google Cloud, platform config files, or dart defines when needed.

Classroom API setup is documented separately in `docs/setup/google-classroom-api.md`.

## Current Runtime Truth

- Android Google Sign-In works.
- Android OAuth client exists in Google Cloud.
- Web OAuth client exists so Android can use its client ID as `serverClientId`.
- Web browser sign-in UI is not configured.
- iOS Google Sign-In is not configured.
- Google Classroom API is now used for one fixed Talkware course.
- Talkware member status remains mock-first.
- Talkware Points remains a placeholder.
- Classroom read scopes are requested through Google Sign-In authorization.
- No Firebase Auth, backend, wallet, or points runtime has been added.

## Android OAuth Client

Google Cloud project:

```txt
Talkware Journey
```

Current Android package/application ID from `android/app/build.gradle.kts`:

```txt
com.example.profile_challenge_app
```

Created Android OAuth client ID:

```txt
448940602292-bb6p7883keo992ostjcl5bpdqh3oj37f.apps.googleusercontent.com
```

This Android client ID is registered in Google Cloud. It should not be pasted into Dart as `serverClientId`.

Android OAuth details:

```txt
Name: Android client talkware
Package name: com.example.profile_challenge_app
SHA-1: 35:32:CF:0C:6F:63:90:78:47:48:9A:DA:31:E8:3D:78:69:92:1D:5E
```

## Web OAuth Client Used As Android serverClientId

Web OAuth client:

```txt
Name: Web client talkware journey
Client ID: 448940602292-6ln99mgjvtrfihnqv8dkop6er0fe10.apps.googleusercontent.com
```

This Web client ID is wired in `GoogleSignInConfig` as the default `serverClientId` for Android.

Do not use or store the Web client secret in the Flutter app. The client secret is for confidential server-side environments, not mobile app code.

## Android Setup Path

1. Create or choose the Google Cloud project.
2. Configure the OAuth consent screen.
3. Create an Android OAuth client.
4. Use the exact Android package name:

```txt
com.example.profile_challenge_app
```

5. Add the SHA-1 fingerprint for the signing key used by the build you are testing.

For the default debug build on Windows, get SHA-1 with:

```powershell
keytool -list -v -alias androiddebugkey -keystore "$env:USERPROFILE\.android\debug.keystore" -storepass android -keypass android
```

6. Fully stop and rebuild the Flutter app before testing sign-in again.

## Important: Android Client ID vs Server Client ID

The Android OAuth client ID is not the same as `serverClientId`.

For `google_sign_in` on Android, the official Android package says:

- If using `google-services.json` with Gradle setup, no Dart IDs are needed as long as `google-services.json` contains a Web OAuth client entry (`client_type: 3`).
- If not using `google-services.json`, Dart must pass the Web OAuth client ID as `serverClientId`.

This project is not using Firebase Auth and does not currently have `google-services.json` configured.

Because a Web OAuth client now exists, its client ID is used as `serverClientId`.

## Current Code Boundary

- `GoogleAuthService` calls `GoogleSignIn.instance.initialize()`.
- `GoogleSignInConfig` can read optional dart defines:
  - `GOOGLE_CLIENT_ID`
  - `GOOGLE_SERVER_CLIENT_ID`
- For the current Android-only setup, the Android OAuth client is handled in Google Cloud by package name and SHA-1 registration.
- The Web OAuth client ID is configured as the default `serverClientId`.
- `GOOGLE_SERVER_CLIENT_ID` can still override the default for future environments.
- Classroom data uses OAuth bearer headers from the signed-in Google account.
- The Classroom URL code is `ODY1MDM2NjY0MDA0`.
- The Classroom API course ID used in `/v1/courses/{id}` calls is `865036664004`.
- The app does not list all Classroom courses.

## Android Verification

Android Google Sign-In has been manually confirmed working with:

```txt
Package name: com.example.profile_challenge_app
SHA-1: 35:32:CF:0C:6F:63:90:78:47:48:9A:DA:31:E8:3D:78:69:92:1D:5E
Web serverClientId: 448940602292-6ln99mgjvtrfihnqv8dkop6er0fe10.apps.googleusercontent.com
```

Do not use the Android OAuth client ID as `GOOGLE_SERVER_CLIENT_ID`.
