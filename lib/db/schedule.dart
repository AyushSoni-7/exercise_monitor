import 'package:exercise_monitor/db/gym_db.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:sqflite/sqflite.dart';

mixin ExerciseDB implements GymDB {
  static const _tableName = setTable;

  Future<List<Map<String, dynamic>>?> queryAll() async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName);
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    return await db?.insert(_tableName, row);
  }

  Future<int?> update(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    int id = row["_id"];
    return await db?.update(_tableName, row,
        where: '$SetTableFields.id: ?', whereArgs: [id]);
  }

  Future<int?> delete(int id) async {
    Database? db = await GymDB.instance.database;
    return await db
        ?.delete(_tableName, where: '$SetTableFields.id: ?', whereArgs: [id]);
  }
}
