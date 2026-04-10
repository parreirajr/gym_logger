import 'package:flutter/material.dart';
import 'data/services/auth_service.dart';
import 'presentation/app.dart';
import 'presentation/routes.dart';

void main() async {
  // Ensure Flutter binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Check authentication status to determine the initial route.
  final bool isLoggedIn = await AuthService.isLoggedIn();
  final String initialRoute = isLoggedIn ? AppRoutes.home : AppRoutes.root;

  // Launch the GymLogger application with the determined initial route.
  runApp(GymLoggerApp(initialRoute: initialRoute));
}
