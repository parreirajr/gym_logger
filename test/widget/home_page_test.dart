import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/domain/models/workout_model.dart';
import 'package:gym_logger/presentation/pages/home_page.dart';
import 'package:gym_logger/presentation/widgets/workout_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  /// Wraps [HomePage] in a [MaterialApp] with the dark theme for testing.
  Widget makeTestableWidget({Map<String, WidgetBuilder>? extraRoutes}) {
    return MaterialApp(
      routes: {'/home': (context) => const HomePage(), ...?extraRoutes},
      initialRoute: '/home',
    );
  }

  final mockWorkout = Workout(
    id: 'test-123',
    exerciseName: 'Supino Reto',
    load: 80.0,
    repetitions: 10,
    date: DateTime(2026, 4, 7),
  );

  // ──────────────────────────────────────────────────────────
  // US1: View Logged Workouts
  // ──────────────────────────────────────────────────────────
  group('HomePage – US1: View Logged Workouts', () {
    testWidgets(
      'Should show empty-state message when no workouts are present',
      (WidgetTester tester) async {
        await tester.pumpWidget(makeTestableWidget());

        expect(find.text('Nenhum treino registrado ainda.'), findsOneWidget);
        expect(find.text('Toque no botão + para começar.'), findsOneWidget);
        expect(find.byType(WorkoutTile), findsNothing);
      },
    );

    testWidgets(
      'Should render a WorkoutTile when a workout is returned from the form',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          makeTestableWidget(
            extraRoutes: {
              '/workout_form': (context) => Scaffold(
                body: ElevatedButton(
                  onPressed: () => Navigator.pop(context, mockWorkout),
                  child: const Text('Save'),
                ),
              ),
            },
          ),
        );

        // Tap FAB
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();

        // Tap Save on the mock form
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        expect(find.byType(WorkoutTile), findsOneWidget);
        expect(find.text('Supino Reto'), findsOneWidget);
      },
    );

    testWidgets(
      'Should render multiple tiles when multiple results are returned',
      (WidgetTester tester) async {
        int idCounter = 0;
        await tester.pumpWidget(
          makeTestableWidget(
            extraRoutes: {
              '/workout_form': (context) => Scaffold(
                body: ElevatedButton(
                  onPressed: () {
                    idCounter++;
                    Navigator.pop(
                      context,
                      mockWorkout.copyWith(id: 'id-$idCounter'),
                    );
                  },
                  child: const Text('Save'),
                ),
              ),
            },
          ),
        );

        for (int i = 0; i < 3; i++) {
          await tester.tap(find.byType(FloatingActionButton));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Save'));
          await tester.pumpAndSettle();
        }

        expect(find.byType(WorkoutTile), findsNWidgets(3));
      },
    );

    testWidgets('Should remove a tile when the delete button is tapped', (
      WidgetTester tester,
    ) async {
      // Setup with a returned workout
      await tester.pumpWidget(
        makeTestableWidget(
          extraRoutes: {
            '/workout_form': (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () => Navigator.pop(context, mockWorkout),
                child: const Text('Save'),
              ),
            ),
          },
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(find.byType(WorkoutTile), findsOneWidget);

      // Tap delete button (text matches WorkoutTile's delete button)
      await tester.tap(find.text('Excluir'));
      await tester.pump();

      expect(find.byType(WorkoutTile), findsNothing);
    });

    testWidgets(
      'Should update an existing tile when an edited workout is returned',
      (WidgetTester tester) async {
        Workout currentMock = mockWorkout;

        await tester.pumpWidget(
          makeTestableWidget(
            extraRoutes: {
              '/workout_form': (context) => Scaffold(
                body: ElevatedButton(
                  onPressed: () => Navigator.pop(context, currentMock),
                  child: const Text('Save'),
                ),
              ),
            },
          ),
        );

        // 1. Initial Load (finish initState)
        await tester.pumpAndSettle();

        // 2. Add initial workout (Supino Reto)
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        expect(find.text('Supino Reto'), findsOneWidget);

        // 3. Update the return value for the next call (Edition)
        currentMock = mockWorkout.copyWith(exerciseName: 'Supino Inclinado');

        // 4. Tap to edit (tapping the Editar button)
        await tester.tap(find.text('Editar'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // 5. Verify update (should be 1 tile with new name)
        expect(find.byType(WorkoutTile), findsOneWidget);
        expect(find.text('Supino Inclinado'), findsOneWidget);
        expect(find.text('Supino Reto'), findsNothing);
      },
    );
  });

  group('HomePage – US2: Floating Action Button', () {
    testWidgets('Should display FAB on the home screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('FAB should use the primary brand color #7C4DFF', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(makeTestableWidget());

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.backgroundColor, const Color(0xFF7C4DFF));
    });
  });
}
