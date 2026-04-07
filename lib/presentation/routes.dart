import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

/// Centralized route definitions for the application.
class AppRoutes {
  // Route Name Constants
  static const String root = '/';
  static const String home = '/home';

  /// Returns the static route mapping for MaterialApp.
  static Map<String, WidgetBuilder> get routes {
    return {
      root: (context) => const LoginPage(),
      home: (context) => const HomePage(),
    };
  }
}
