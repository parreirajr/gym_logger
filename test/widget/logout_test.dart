import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_logger/presentation/app.dart';
import 'package:gym_logger/presentation/pages/home_page.dart';
import 'package:gym_logger/presentation/pages/login_page.dart';

void main() {
  testWidgets('should redirect to LoginPage when Logout button is clicked', (WidgetTester tester) async {
    // 1. Initial State: Logged In
    SharedPreferences.setMockInitialValues({'is_logged': true});
    
    // 2. Start at Home
    await tester.pumpWidget(const GymLoggerApp(initialRoute: '/home'));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    // 3. Find and Click Logout Button
    final logoutButton = find.byIcon(Icons.logout_rounded);
    expect(logoutButton, findsOneWidget);
    
    await tester.tap(logoutButton);
    await tester.pumpAndSettle();

    // 4. Verify Redirection to Login
    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });
}
