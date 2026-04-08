import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/presentation/pages/workout_form_page.dart';
import 'package:gym_logger/domain/models/workout_model.dart';

void main() {
  group('WorkoutFormPage Widget Tests', () {
    testWidgets('Should display all required form fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WorkoutFormPage(),
        ),
      );

      // Verify presence of fields and their labels
      expect(find.text('Exercício'), findsOneWidget);
      expect(find.text('Carga (kg)'), findsOneWidget);
      expect(find.text('Repetições'), findsOneWidget);
      expect(find.text('Data'), findsOneWidget);
      
      // Verify presence of input fields by type or hint
      expect(find.byType(TextFormField), findsNWidgets(3));
      
      // Verify presence of Save button
      expect(find.widgetWithText(ElevatedButton, 'SALVAR'), findsOneWidget);
    });

    testWidgets('Should show validation errors when fields are empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: WorkoutFormPage()),
      );

      // Tap Save without filling anything
      await tester.tap(find.text('SALVAR'));
      await tester.pump();

      // Check for error messages
      expect(find.text('Informe o nome do exercício'), findsOneWidget);
      expect(find.text('Obrigatório'), findsNWidgets(2));
    });

    testWidgets('Should successfully return a Workout object when valid', (WidgetTester tester) async {
      Workout? returnedWorkout;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                returnedWorkout = await Navigator.push<Workout>(
                  context,
                  MaterialPageRoute(builder: (context) => const WorkoutFormPage()),
                );
              },
              child: const Text('Open Form'),
            ),
          ),
        ),
      );

      // Open the form
      await tester.tap(find.text('Open Form'));
      await tester.pumpAndSettle();

      // Fill the fields
      await tester.enterText(find.byType(TextFormField).at(0), 'Supino');
      await tester.enterText(find.byType(TextFormField).at(1), '80');
      await tester.enterText(find.byType(TextFormField).at(2), '10');
      
      // Save
      await tester.tap(find.text('SALVAR'));
      await tester.pumpAndSettle();

      // Check the result
      expect(returnedWorkout, isNotNull);
      expect(returnedWorkout!.exerciseName, 'Supino');
      expect(returnedWorkout!.load, 80.0);
      expect(returnedWorkout!.repetitions, 10);
    });

    testWidgets('Should pre-fill fields and retain ID when in edition mode', (WidgetTester tester) async {
      final existingWorkout = Workout(
        id: 'existing-id',
        exerciseName: 'Agachamento',
        load: 100.0,
        repetitions: 8,
        date: DateTime(2024, 04, 07),
      );
      
      Workout? returnedWorkout;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                returnedWorkout = await Navigator.push<Workout>(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(arguments: existingWorkout),
                    builder: (context) => const WorkoutFormPage(),
                  ),
                );
              },
              child: const Text('Open Edit Form'),
            ),
          ),
        ),
      );

      // Open the form
      await tester.tap(find.text('Open Edit Form'));
      await tester.pumpAndSettle();

      // Verify pre-filled values
      expect(find.text('Agachamento'), findsOneWidget);
      expect(find.text('100.0'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('07/04/2024'), findsOneWidget);
      
      // Verify AppBar title and button text
      expect(find.text('EDITAR TREINO'), findsOneWidget);
      expect(find.text('ATUALIZAR'), findsOneWidget);

      // Modify a field
      await tester.enterText(find.byType(TextFormField).at(1), '110');
      
      // Save
      await tester.tap(find.text('ATUALIZAR'));
      await tester.pumpAndSettle();

      // Check the result
      expect(returnedWorkout, isNotNull);
      expect(returnedWorkout!.id, 'existing-id'); // Must retain ID
      expect(returnedWorkout!.exerciseName, 'Agachamento');
      expect(returnedWorkout!.load, 110.0); // Updated value
    });
  });
}
