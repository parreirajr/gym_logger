import 'package:shared_preferences/shared_preferences.dart';

/// Service responsible for managing the authentication state of the application.
/// 
/// Handles persistent storage of the login status using [SharedPreferences].
class AuthService {
  /// Local storage key for the login status.
  static const String _isLoggedKey = 'is_logged';

  /// Returns whether the user is currently logged in.
  /// 
  /// Defaults to false if no value is found in storage.
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedKey) ?? false;
  }

  /// Sets the login status in persistent storage.
  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedKey, value);
  }
}
