import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ards/main.dart'; // Update with the correct import path for your app

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Load the app
    await tester.pumpWidget(MyApp());

    // Verify counter starts at "0"
    expect(find.text('0'), findsOneWidget);

    // Find the floating action button
    final Finder fab = find.byIcon(Icons.add);
    expect(fab, findsOneWidget);

    // Tap the button and trigger a frame
    await tester.tap(fab);
    await tester.pump();

    // Verify counter increments to "1"
    expect(find.text('1'), findsOneWidget);
  });
}
