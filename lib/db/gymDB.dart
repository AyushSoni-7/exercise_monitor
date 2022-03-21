import 'dart:io';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class GymDB {
  static final String _databaseName = "gym.db";
  static final int _dbVersion = 1;

  GymDB._privateConstructor();

  static final GymDB instance = GymDB._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _dbVersion, onCreate: _addTables);
  }

  Future _addTables(Database db, int version) async {
    const _idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const _textType = "TEXT NOT NULL";
    const _boolType = "BOOLEAN NOT NULL";
    const _intType = "INTEGER NOT NULL";
    const _doubltType = "NUMERIC NOT NULL";

    db.execute('''
      CREATE TABLE $exerciseTable (
        ${ExerciseFields.id} $_idType,
        ${ExerciseFields.name} $_textType,
        ${ExerciseFields.imgSrc} $_textType,
        ${ExerciseFields.muscleId} $_intType
      )
      ''');
  }
}
