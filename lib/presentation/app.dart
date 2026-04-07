import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'routes.dart';

/// The root widget of the GymLogger application.
/// Configures MaterialApp with the custom dark theme and named route mapping.
class GymLoggerApp extends StatelessWidget {
  const GymLoggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymLogger',
      
      // Theme Configuration (Material 3 Dark)
      theme: AppTheme.darkTheme,
      
      // Navigation Configuration (Navigator 1.0)
      initialRoute: AppRoutes.root,
      routes: AppRoutes.routes,
    );
  }
}
