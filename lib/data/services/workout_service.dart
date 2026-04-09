import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/workout_model.dart';

/// Service responsible for persisting workout records using shared_preferences.
/// 
/// Follows the Gym Logger constitution:
/// - JSON serialization for storage.
/// - Single responsibility for persistence.
class WorkoutService {
  static const String _storageKey = 'gym_logger_workouts';

  /// Saves the entire list of [workouts] to local storage.
  Future<void> saveWorkouts(List<Workout> workouts) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(
      workouts.map((w) => w.toJson()).toList(),
    );
    await prefs.setString(_storageKey, jsonString);
  }

  /// Loads the list of workouts from local storage.
  /// Returns an empty list if no data is found or in case of error.
  Future<List<Workout>> loadWorkouts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_storageKey);

      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((item) => Workout.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Basic error handling for persistence failures as per constitution.
      debugPrint('Error loading workouts: $e');
      return [];
    }
  }
}

/// Simple helper to avoid import issues with debugPrint if not provided by material.
void debugPrint(String message) {
  // ignore: avoid_print
  print('[WorkoutService] $message');
}
