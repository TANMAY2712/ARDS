import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ards/main.dart';
import 'package:ards/login/login-page.dart';

void main() {
  testWidgets('App launches and shows LoginPage', (WidgetTester tester) async {
    // Load MyApp
    await tester.pumpWidget(MyApp());

    // Wait for UI to build
    await tester.pumpAndSettle();

    // Verify LoginPage is displayed
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
