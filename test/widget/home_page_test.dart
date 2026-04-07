import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/domain/models/workout_model.dart';
import 'package:gym_logger/presentation/pages/home_page.dart';
import 'package:gym_logger/presentation/widgets/workout_tile.dart';

void main() {
  /// Wraps [HomePage] in a [MaterialApp] with the dark theme for testing.
  Widget makeTestableWidget() {
    return const MaterialApp(
      home: HomePage(),
    );
  }

  // ──────────────────────────────────────────────────────────
  // US1: View Logged Workouts
  // ──────────────────────────────────────────────────────────
  group('HomePage – US1: View Logged Workouts', () {
    testWidgets('Should show empty-state message when no workouts are present',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      expect(find.text('Nenhum treino registrado ainda.'), findsOneWidget);
      expect(find.text('Toque no botão + para começar.'), findsOneWidget);
      expect(find.byType(WorkoutTile), findsNothing);
    });

    testWidgets('Should render one WorkoutTile per workout after FAB is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      // Tap FAB once
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(WorkoutTile), findsOneWidget);
      expect(find.text('Nenhum treino registrado ainda.'), findsNothing);
    });

    testWidgets('Should render multiple tiles when FAB is tapped multiple times',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(WorkoutTile), findsNWidgets(3));
    });

    testWidgets('Should remove a tile when the delete button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      // Add one workout
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(WorkoutTile), findsOneWidget);

      // Tap delete button
      await tester.tap(find.text('Excluir'));
      await tester.pump();

      // List should now be empty
      expect(find.byType(WorkoutTile), findsNothing);
      expect(find.text('Nenhum treino registrado ainda.'), findsOneWidget);
    });

    testWidgets('Should show exercise name highlighted in each WorkoutTile',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // The mock workout uses 'Supino Reto'
      expect(find.text('Supino Reto'), findsOneWidget);
    });
  });

  // ──────────────────────────────────────────────────────────
  // US2: Initiate Workout Addition (FAB)
  // ──────────────────────────────────────────────────────────
  group('HomePage – US2: Floating Action Button', () {
    testWidgets('Should display FAB on the home screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('FAB should use the primary brand color #7C4DFF',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.backgroundColor, const Color(0xFF7C4DFF));
    });

    testWidgets('Tapping FAB should add an item to the list',
        (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget());

      expect(find.byType(WorkoutTile), findsNothing);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.byType(WorkoutTile), findsOneWidget);
    });
  });
}
