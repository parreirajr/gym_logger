import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gym_logger/domain/models/workout_model.dart';
import 'package:gym_logger/data/repositories/workout_repository.dart';
import 'package:gym_logger/data/database/database_helper.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

class MockDatabase extends Mock implements Database {}

void main() {
  late WorkoutRepositoryImpl repository;
  late MockDatabaseHelper mockDbHelper;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDbHelper = MockDatabaseHelper();
    mockDatabase = MockDatabase();
    when(() => mockDbHelper.database).thenAnswer((_) async => mockDatabase);
    repository = WorkoutRepositoryImpl(dbHelper: mockDbHelper);
  });

  group('WorkoutRepository CRUD', () {
    final workout = Workout(
      id: 'uuid-1',
      exerciseName: 'Squat',
      load: 120.0,
      repetitions: 8,
      date: DateTime.parse('2026-04-10T10:00:00.000Z'),
    );

    test('insertWorkout calls db.insert with correct parameters', () async {
      when(
        () => mockDatabase.insert(
          any(),
          any(),
          conflictAlgorithm: any(named: 'conflictAlgorithm'),
        ),
      ).thenAnswer((_) async => 1);

      await repository.insertWorkout(workout);

      verify(
        () => mockDatabase.insert(
          DatabaseHelper.tableWorkouts,
          workout.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ),
      ).called(1);
    });

    test('getWorkouts returns a list of workouts', () async {
      final List<Map<String, dynamic>> mockResult = [workout.toMap()];
      when(
        () => mockDatabase.query(any(), orderBy: any(named: 'orderBy')),
      ).thenAnswer((_) async => mockResult);

      final result = await repository.getWorkouts();

      expect(result.length, 1);
      expect(result.first.id, 'uuid-1');
      expect(result.first.exerciseName, 'Squat');
    });

    test('updateWorkout calls db.update with correct parameters', () async {
      when(
        () => mockDatabase.update(
          any(),
          any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'),
        ),
      ).thenAnswer((_) async => 1);

      await repository.updateWorkout(workout);

      verify(
        () => mockDatabase.update(
          DatabaseHelper.tableWorkouts,
          workout.toMap(),
          where: '${DatabaseHelper.columnId} = ?',
          whereArgs: [workout.id],
        ),
      ).called(1);
    });

    test('deleteWorkout calls db.delete with correct parameters', () async {
      const id = 'uuid-1';
      when(
        () => mockDatabase.delete(
          any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'),
        ),
      ).thenAnswer((_) async => 1);

      await repository.deleteWorkout(id);

      verify(
        () => mockDatabase.delete(
          DatabaseHelper.tableWorkouts,
          where: '${DatabaseHelper.columnId} = ?',
          whereArgs: [id],
        ),
      ).called(1);
    });
  });
}
