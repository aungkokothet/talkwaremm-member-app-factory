import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/main_app.dart';

void main() {
  testWidgets('starts on sign in and opens the member profile', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(AppString.signInTitle), findsOneWidget);
    expect(find.text(AppString.signInWithGoogle), findsOneWidget);

    await tester.tap(find.text(AppString.signInWithGoogle));
    await tester.pumpAndSettle();

    expect(find.text(AppString.profileTitle), findsNothing);
    expect(find.text(AppString.mockMemberFullName), findsOneWidget);
    expect(find.text(AppString.mockMemberEmail), findsOneWidget);
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
  });
}
