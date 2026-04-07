import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/presentation/app.dart';

void main() {
  testWidgets('Initial route displays LoginPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GymLoggerApp());

    // Verify that the app title 'GymLogger' is present.
    expect(find.text('GymLogger'), findsOneWidget);
    
    // Verify that the 'ENTRAR' button is present.
    expect(find.text('ENTRAR'), findsOneWidget);
    
    // Verify that the fitness center icon is present.
    expect(find.byIcon(Icons.fitness_center), findsOneWidget);
  });
}
