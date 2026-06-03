import 'package:google_sign_in/google_sign_in.dart';

class AppIdentity {
  const AppIdentity({
    required this.fullName,
    required this.email,
    this.photoUrl,
  });

  factory AppIdentity.fromGoogleAccount(GoogleSignInAccount account) {
    return AppIdentity(
      fullName: account.displayName ?? account.email,
      email: account.email,
      photoUrl: account.photoUrl,
    );
  }

  final String fullName;
  final String email;
  final String? photoUrl;

  String get initials {
    final parts = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();

    if (parts.isEmpty) {
      return email.isNotEmpty ? email[0].toUpperCase() : '';
    }

    return parts.take(2).map((part) => part[0].toUpperCase()).join();
  }
}
