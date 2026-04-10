import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_logger/data/services/auth_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AuthService', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('should return false by default when no value is stored', () async {
      final isLoggedIn = await AuthService.isLoggedIn();
      expect(isLoggedIn, isFalse);
    });

    test('should return true after setLoggedIn(true) is called', () async {
      await AuthService.setLoggedIn(true);
      final isLoggedIn = await AuthService.isLoggedIn();
      expect(isLoggedIn, isTrue);
    });

    test('should return false after setLoggedIn(false) is called', () async {
      await AuthService.setLoggedIn(true); // Pre-condition
      await AuthService.setLoggedIn(false);
      final isLoggedIn = await AuthService.isLoggedIn();
      expect(isLoggedIn, isFalse);
    });
  });
}
