import '../models/login_credentials.dart';

/// Isolated logic for credential validation (Constitution Rule I).
class LoginValidator {
  /// Validates if the provided credentials match the hardcoded defaults.
  static bool validate(LoginCredentials credentials) {
    return credentials.username == 'admin' && credentials.password == '1234';
  }

  /// Returns a user-friendly error message based on inputs.
  static String? getErrorMessage(String username, String password) {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      return 'Usuário e senha são obrigatórios';
    }
    
    if (username != 'admin' || password != '1234') {
      return 'Acesso negado';
    }

    return null;
  }
}
