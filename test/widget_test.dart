import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/app/constant/resources/app_string.dart';
import 'package:profile_challenge_app/main_app.dart';

void main() {
  testWidgets('shows the profile challenge screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Maya Chen'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('opens the mock member dashboard and signs in', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip(AppString.memberDashboardAction));
    await tester.pumpAndSettle();

    expect(find.text(AppString.memberDashboardTitle), findsWidgets);
    expect(find.text(AppString.signedOutMessage), findsOneWidget);

    await tester.tap(find.text(AppString.signInWithGoogle));
    await tester.pumpAndSettle();

    expect(find.text(AppString.memberStatusTitle), findsOneWidget);
    expect(find.text(AppString.classroomTitle), findsOneWidget);
    expect(find.text('maya.chen@example.com'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text(AppString.pointsTitle),
      120,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text(AppString.pointsTitle), findsOneWidget);
  });
}
