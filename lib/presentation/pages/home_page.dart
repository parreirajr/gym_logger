import 'package:flutter/material.dart';

/// The main dashboard of the GymLogger application.
/// Acts as a placeholder for exercise and session management.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEUS TREINOS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder Icon/Graphic
            const Icon(
              Icons.list_alt_rounded,
              size: 100,
              color: Colors.white24,
            ),
            const SizedBox(height: 24),
            
            // Placeholder Text
            const Text(
              'Nenhum treino registrado ainda.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            
            const Text(
              'Toque no botão abaixo para começar.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
      
      // Floating Action Button Placeholder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for adding new exercise action
        },
        backgroundColor: const Color(0xFF7C4DFF),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
    );
  }
}
