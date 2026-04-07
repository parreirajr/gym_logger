/// Immutable domain model representing a single workout record.
///
/// All field identifiers are in English. Portuguese is used exclusively
/// for UI display labels in the presentation layer.
class Workout {
  final String id;
  final String exerciseName;
  final double load;
  final int repetitions;
  final DateTime date;

  const Workout({
    required this.id,
    required this.exerciseName,
    required this.load,
    required this.repetitions,
    required this.date,
  });

  /// Creates a [Workout] from a JSON map.
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as String,
      exerciseName: json['exercise_name'] as String,
      load: (json['load'] as num).toDouble(),
      repetitions: json['repetitions'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }

  /// Converts this [Workout] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exercise_name': exerciseName,
      'load': load,
      'repetitions': repetitions,
      'date': date.toIso8601String(),
    };
  }

  /// Returns a copy of this [Workout] with the given fields replaced.
  Workout copyWith({
    String? id,
    String? exerciseName,
    double? load,
    int? repetitions,
    DateTime? date,
  }) {
    return Workout(
      id: id ?? this.id,
      exerciseName: exerciseName ?? this.exerciseName,
      load: load ?? this.load,
      repetitions: repetitions ?? this.repetitions,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Workout && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Workout(id: $id, exerciseName: $exerciseName, load: $load, '
      'repetitions: $repetitions, date: $date)';
}
