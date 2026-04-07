import 'package:flutter/material.dart';
import 'presentation/app.dart';

void main() {
  // Ensure Flutter binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();
  
  // Launch the GymLogger application.
  runApp(const GymLoggerApp());
}
