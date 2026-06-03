import 'package:google_sign_in/google_sign_in.dart';

class AppIdentity {
  const AppIdentity({
    required this.fullName,
    required this.email,
    this.photoUrl,
    this.classroomAuthHeaders,
  });

  factory AppIdentity.fromGoogleAccount(
    GoogleSignInAccount account, {
    Map<String, String>? classroomAuthHeaders,
  }) {
    final displayName = account.displayName?.trim();

    return AppIdentity(
      fullName: displayName == null || displayName.isEmpty
          ? account.email
          : displayName,
      email: account.email.trim(),
      photoUrl: account.photoUrl?.trim(),
      classroomAuthHeaders: classroomAuthHeaders,
    );
  }

  final String fullName;
  final String email;
  final String? photoUrl;
  final Map<String, String>? classroomAuthHeaders;

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
