import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/presentation/pages/login_page.dart';
import 'package:gym_logger/presentation/pages/home_page.dart';
import 'package:gym_logger/presentation/routes.dart';

void main() {
  /// Helper to wrap widgets in a Material App with named routes for testing.
  Widget makeTestableWidget(Widget child) {
    return MaterialApp(initialRoute: AppRoutes.root, routes: AppRoutes.routes);
  }

  group('LoginPage Widget Tests', () {
    testWidgets('Should display login form fields and title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget(const LoginPage()));

      expect(find.text('GymLogger'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2)); // User and Pass
      expect(find.text('LOGIN'), findsOneWidget);
    });

    testWidgets('Should show error SnackBar on invalid credentials', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget(const LoginPage()));

      // Type wrong credentials
      await tester.enterText(find.byType(TextField).first, 'wrong_user');
      await tester.enterText(find.byType(TextField).last, 'wrong_pass');

      // Tap login
      await tester.tap(find.text('LOGIN'));
      await tester.pumpAndSettle();

      // Check for SnackBar (Acesso negado)
      expect(find.text('Acesso negado'), findsOneWidget);
    });

    testWidgets('Should navigate to HomePage on valid credentials', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget(const LoginPage()));

      // Type valid credentials
      await tester.enterText(find.byType(TextField).first, 'admin');
      await tester.enterText(find.byType(TextField).last, '1234');

      // Tap login
      await tester.tap(find.text('LOGIN'));
      await tester.pumpAndSettle();

      // Check if we are on HomePage
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(LoginPage), findsNothing);
    });
  });
}
