import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/app/features/auth/model/app_identity.dart';
import 'package:profile_challenge_app/app/features/auth/service/auth_service.dart';
import 'package:profile_challenge_app/main_app.dart';

class FakeAuthService implements AuthService {
  static const identity = AppIdentity(
    fullName: 'Maya Chen',
    email: 'maya.chen@example.com',
  );

  @override
  Future<AppIdentity?> restoreSession() async => null;

  @override
  Future<AppIdentity?> signIn() async => identity;

  @override
  Future<void> signOut() async {}
}

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put<AuthService>(FakeAuthService(), permanent: true);
  });

  tearDown(Get.reset);

  testWidgets('starts on sign in and opens the member profile', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(AppString.signInTitle), findsOneWidget);
    expect(find.text(AppString.signInWithGoogle), findsOneWidget);

    await tester.tap(find.text(AppString.signInWithGoogle));
    await tester.pumpAndSettle();

    expect(find.text(AppString.profileTitle), findsNothing);
    expect(find.text(FakeAuthService.identity.fullName), findsOneWidget);
    expect(find.text(FakeAuthService.identity.email), findsOneWidget);
    expect(find.text(AppString.memberStatusTitle), findsOneWidget);
    expect(find.text(AppString.classroomTitle), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text(AppString.pointsTitle),
      120,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text(AppString.pointsTitle), findsOneWidget);
  });

  testWidgets('signs out from the hamburger menu', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text(AppString.signInWithGoogle));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text(AppString.profileMenuTitle), findsOneWidget);
    expect(find.text(AppString.signOut), findsOneWidget);

    await tester.tap(find.text(AppString.signOut));
    await tester.pumpAndSettle();

    expect(find.text(AppString.signInTitle), findsOneWidget);
    expect(find.text(AppString.signInWithGoogle), findsOneWidget);
    expect(find.text(AppString.signingInMessage), findsNothing);
  });
}
