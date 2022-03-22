import 'dart:io';
import 'package:exercise_monitor/db/create_table.dart';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/muscle.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class GymDB {
  static const String _databaseName = "gym.db";
  static const int _dbVersion = 1;

  GymDB._privateConstructor();

  static final GymDB instance = GymDB._privateConstructor();

  static Database? _db;

  Future<Database?> get database async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _dbVersion, onCreate: createTable);
  }

  Future close() async {
    final db = await instance.database;
    db?.close();
  }
}
