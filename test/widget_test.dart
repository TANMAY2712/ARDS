import 'package:flutter_test/flutter_test.dart';
import 'package:ards/main.dart';
import 'package:ards/login/loginpage.dart';

void main() {
  testWidgets('ARDS Project', (WidgetTester tester) async {
    // Load MyApp
    await tester.pumpWidget(MyApp(isLoggedIn: false));

    // Wait for UI to build
    await tester.pumpAndSettle();

    // Verify LoginPage is displayed
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
