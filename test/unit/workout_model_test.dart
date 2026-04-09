import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/domain/models/workout_model.dart';

void main() {
  group('Workout Model Serialization', () {
    final testWorkout = Workout(
      id: '1',
      exerciseName: 'Bench Press',
      load: 100.0,
      repetitions: 10,
      date: DateTime(2026, 4, 9, 10, 0),
    );

    test('toJson should return a valid Map', () {
      final json = testWorkout.toJson();

      expect(json['id'], '1');
      expect(json['exercise_name'], 'Bench Press');
      expect(json['load'], 100.0);
      expect(json['repetitions'], 10);
      expect(json['date'], testWorkout.date.toIso8601String());
    });

    test('fromJson should return a valid Workout object', () {
      final json = {
        'id': '2',
        'exercise_name': 'Squat',
        'load': 120.5,
        'repetitions': 8,
        'date': '2026-04-09T11:00:00.000',
      };

      final workout = Workout.fromJson(json);

      expect(workout.id, '2');
      expect(workout.exerciseName, 'Squat');
      expect(workout.load, 120.5);
      expect(workout.repetitions, 8);
      expect(workout.date, DateTime.parse('2026-04-09T11:00:00.000'));
    });

    test('Serialization round-trip should be consistent', () {
      final json = testWorkout.toJson();
      final fromJson = Workout.fromJson(json);

      expect(fromJson, testWorkout);
      expect(fromJson.toJson(), json);
    });
  });
}
