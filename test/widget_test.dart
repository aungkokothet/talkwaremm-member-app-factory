import 'package:flutter_test/flutter_test.dart';
import 'package:profile_challenge_app/main_app.dart';

void main() {
  testWidgets('shows the profile challenge screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Maya Chen'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });
}
