import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uts_flutter/main.dart'; // Adjust this import as necessary

void main() {
  testWidgets('LoginPage has login button', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the LoginPage is displayed.
    expect(find.text('Login'), findsOneWidget);

    // Verify that the Login button is present.
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the login button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Additional checks can be added here based on what happens when the button is tapped.
  });

  testWidgets('RegisterPage has register button', (WidgetTester tester) async {
    // Navigate to the RegisterPage.
    await tester.pumpWidget(MyApp());
    await tester.tap(find.text('Belum punya akun? Daftar'));
    await tester.pumpAndSettle(); // Wait for the navigation

    // Verify that the RegisterPage is displayed.
    expect(find.text('Daftar'), findsOneWidget);

    // Verify that the Register button is present.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
