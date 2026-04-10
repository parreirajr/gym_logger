class ExerciseRecord {
  final String id;
  final String exercise;
  final double loadKg;
  final int repetitions;
  final DateTime date;

  ExerciseRecord({
    required this.id,
    required this.exercise,
    required this.loadKg,
    required this.repetitions,
    required this.date,
  });

  /// Creates a copy of this ExerciseRecord but with the given fields replaced with the new values.
  ExerciseRecord copyWith({
    String? id,
    String? exercise,
    double? loadKg,
    int? repetitions,
    DateTime? date,
  }) {
    return ExerciseRecord(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      loadKg: loadKg ?? this.loadKg,
      repetitions: repetitions ?? this.repetitions,
      date: date ?? this.date,
    );
  }

  /// Converts a JSON Map into an ExerciseRecord instance.
  factory ExerciseRecord.fromJson(Map<String, dynamic> json) {
    return ExerciseRecord(
      id: json['id'] as String,
      exercise: json['exercise'] as String,
      loadKg: (json['loadKg'] as num).toDouble(),
      repetitions: json['repetitions'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }

  /// Converts this ExerciseRecord instance into a JSON Map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exercise': exercise,
      'loadKg': loadKg,
      'repetitions': repetitions,
      'date': date.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'ExerciseRecord(id: $id, exercise: $exercise, loadKg: $loadKg, repetitions: $repetitions, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseRecord &&
        other.id == id &&
        other.exercise == exercise &&
        other.loadKg == loadKg &&
        other.repetitions == repetitions &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        exercise.hashCode ^
        loadKg.hashCode ^
        repetitions.hashCode ^
        date.hashCode;
  }
}
