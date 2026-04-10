import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "gym_logger.db";
  static const _databaseVersion = 1;

  static const tableWorkouts = 'workouts';

  static const columnId = 'id';
  static const columnExerciseName = 'exercise_name';
  static const columnLoad = 'load';
  static const columnRepetitions = 'repetitions';
  static const columnDate = 'date';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase(_databaseName);
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }
    
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableWorkouts (
        $columnId TEXT PRIMARY KEY,
        $columnExerciseName TEXT NOT NULL,
        $columnLoad REAL NOT NULL,
        $columnRepetitions INTEGER NOT NULL,
        $columnDate TEXT NOT NULL
      )
    ''');
  }
}
