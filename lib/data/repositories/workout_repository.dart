import 'package:sqflite/sqflite.dart';
import '../../domain/models/workout_model.dart';
import '../database/database_helper.dart';

abstract interface class WorkoutRepository {
  Future<void> insertWorkout(Workout workout);
  Future<List<Workout>> getWorkouts();
  Future<void> updateWorkout(Workout workout);
  Future<void> deleteWorkout(String id);
}

class WorkoutRepositoryImpl implements WorkoutRepository {
  final DatabaseHelper _dbHelper;

  WorkoutRepositoryImpl({DatabaseHelper? dbHelper})
    : _dbHelper = dbHelper ?? DatabaseHelper.instance;

  @override
  Future<void> insertWorkout(Workout workout) async {
    final db = await _dbHelper.database;
    await db.insert(
      DatabaseHelper.tableWorkouts,
      workout.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Workout>> getWorkouts() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      DatabaseHelper.tableWorkouts,
      orderBy: '${DatabaseHelper.columnDate} DESC',
    );

    return List.generate(maps.length, (i) {
      return Workout.fromMap(maps[i]);
    });
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    final db = await _dbHelper.database;
    await db.update(
      DatabaseHelper.tableWorkouts,
      workout.toMap(),
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [workout.id],
    );
  }

  @override
  Future<void> deleteWorkout(String id) async {
    final db = await _dbHelper.database;
    await db.delete(
      DatabaseHelper.tableWorkouts,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [id],
    );
  }
}
