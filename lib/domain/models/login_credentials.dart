/// Simple data model for storage of user login inputs.
class LoginCredentials {
  final String username;
  final String password;

  const LoginCredentials({required this.username, required this.password});

  /// Mandatory conversion to JSON for potential persistence (Constitution Rule V).
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }

  /// Mandatory conversion from JSON (Constitution Rule V).
  factory LoginCredentials.fromJson(Map<String, dynamic> json) {
    return LoginCredentials(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  /// Helper to check if inputs are valid for processing.
  bool get isValid => username.isNotEmpty && password.isNotEmpty;
}
