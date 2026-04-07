import 'package:flutter/material.dart';
import '../../domain/models/login_credentials.dart';
import '../../domain/validators/login_validator.dart';
import '../routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// The entry page of the GymLogger application.
/// Manages user authentication state and navigation (Constitution Rule II).
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Input controllers (T007)
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Handles the login action by invoking the validator and navigating on success (T009, T010).
  void _handleLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Isolation of validation logic (T001 integration)
    final error = LoginValidator.getErrorMessage(username, password);

    if (error != null) {
      _showError(error);
      return;
    }

    final credentials = LoginCredentials(username: username, password: password);
    
    if (LoginValidator.validate(credentials)) {
      // Success: Navigate to Home using pushReplacement (T010)
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      _showError('Acesso negado');
    }
  }

  /// Displays error feedback via SnackBar (T011).
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo/Icon (T008)
              Icon(
                Icons.fitness_center,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              
              // App Title (T008)
              const Text(
                'GymLogger',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              
              const Text(
                'Registre seus treinos com facilidade.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Username Field (T103 integration)
              CustomTextField(
                controller: _usernameController,
                label: 'Usuário',
                hint: 'Digite seu usuário',
                keyboardType: TextInputType.emailAddress,
              ),

              // Password Field (T103 integration)
              CustomTextField(
                controller: _passwordController,
                label: 'Senha',
                hint: 'Digite sua senha',
                obscureText: true,
              ),
              const SizedBox(height: 24),

              // Login Button (T104 integration)
              CustomButton(
                label: 'LOGIN',
                isLoading: _isLoading,
                onPressed: _handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
