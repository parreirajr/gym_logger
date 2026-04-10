import 'package:flutter_test/flutter_test.dart';
import 'package:gym_logger/domain/models/workout_model.dart';

void main() {
  group('Workout Model Map Serialization Tests', () {
    final workout = Workout(
      id: 'test-uuid',
      exerciseName: 'Bench Press',
      load: 100.5,
      repetitions: 10,
      date: DateTime.parse('2026-04-10T10:00:00.000Z'),
    );

    final workoutMap = {
      'id': 'test-uuid',
      'exercise_name': 'Bench Press',
      'load': 100.5,
      'repetitions': 10,
      'date': '2026-04-10T10:00:00.000Z',
    };

    test('toMap() correctly serializes a Workout object', () {
      final map = workout.toMap();
      expect(map, equals(workoutMap));
    });

    test('fromMap() correctly deserializes a map into a Workout object', () {
      final deserializedWorkout = Workout.fromMap(workoutMap);
      expect(deserializedWorkout, equals(workout));
      expect(deserializedWorkout.id, equals(workout.id));
      expect(deserializedWorkout.exerciseName, equals(workout.exerciseName));
      expect(deserializedWorkout.load, equals(workout.load));
      expect(deserializedWorkout.repetitions, equals(workout.repetitions));
      expect(deserializedWorkout.date, equals(workout.date));
    });
  });
}
