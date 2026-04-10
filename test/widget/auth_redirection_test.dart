import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_logger/presentation/app.dart';
import 'package:gym_logger/presentation/pages/home_page.dart';
import 'package:gym_logger/presentation/pages/login_page.dart';

void main() {
  group('Auth Redirection Widget Test', () {
    testWidgets('should start on LoginPage when initialRoute is root', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({'is_logged': false});
      
      await tester.pumpWidget(const GymLoggerApp(initialRoute: '/'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(HomePage), findsNothing);
    });

    testWidgets('should start on HomePage when initialRoute is home', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({'is_logged': true});
      
      await tester.pumpWidget(const GymLoggerApp(initialRoute: '/home'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(LoginPage), findsNothing);
    });
  });
}
