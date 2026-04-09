import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_logger/domain/models/workout_model.dart';
import 'package:gym_logger/data/services/workout_service.dart';

void main() {
  group('WorkoutService Tests', () {
    late WorkoutService service;
    const String storageKey = 'gym_logger_workouts';

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      service = WorkoutService();
    });

    final testWorkouts = [
      Workout(
        id: '1',
        exerciseName: 'Bench Press',
        load: 100.0,
        repetitions: 10,
        date: DateTime(2026, 4, 9),
      ),
      Workout(
        id: '2',
        exerciseName: 'Squat',
        load: 120.0,
        repetitions: 8,
        date: DateTime(2026, 4, 9),
      ),
    ];

    test('loadWorkouts should return empty list when no data is saved', () async {
      final workouts = await service.loadWorkouts();
      expect(workouts, isEmpty);
    });

    test('saveWorkouts should persist data in SharedPreferences', () async {
      await service.saveWorkouts(testWorkouts);

      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(storageKey);

      expect(jsonString, isNotNull);
      final list = jsonDecode(jsonString!) as List;
      expect(list.length, 2);
      expect(list[0]['exercise_name'], 'Bench Press');
    });

    test('loadWorkouts should return saved data correctly', () async {
      await service.saveWorkouts(testWorkouts);

      final loaded = await service.loadWorkouts();

      expect(loaded.length, 2);
      expect(loaded[0].exerciseName, 'Bench Press');
      expect(loaded[1].exerciseName, 'Squat');
    });

    test('loadWorkouts should handle corrupted data gracefully', () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(storageKey, 'invalid json');

      final workouts = await service.loadWorkouts();
      expect(workouts, isEmpty);
    });
  });
}
