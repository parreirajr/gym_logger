import 'package:flutter/material.dart';

/// Central theme definition for GymLogger.
/// Adheres to Material 3 standards and uses the specified dark color palette.
class AppTheme {
  // Hex color constants as defined in the specification.
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color primaryColor = Color(0xFF7C4DFF);

  /// Returns the customized dark theme data for the application.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // ColorScheme definition
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary:
            primaryColor, // Using primary for secondary items as per palette focus
        surface: surfaceColor,
        onPrimary: Colors.white,
        onSurface: Colors.white,
      ),

      // Scaffold background
      scaffoldBackgroundColor: backgroundColor,

      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // Card theme
      cardTheme: const CardThemeData(
        color: surfaceColor,
        elevation: 2,
        margin: EdgeInsets.all(8),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // SnackBar theme
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: surfaceColor,
        contentTextStyle: TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),

      // Text Selection
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor,
        selectionHandleColor: primaryColor,
      ),
    );
  }
}
