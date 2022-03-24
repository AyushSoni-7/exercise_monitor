import 'package:exercise_monitor/db/gym_db.dart';
import 'package:exercise_monitor/models/muscle.dart';
import 'package:sqflite/sqflite.dart';

mixin MuscleDB implements GymDB {
  static const _tableName = muscleTable;

  static Future<List<Map<String, dynamic>>?> queryAll() async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>?> queryByName(String name) async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName,
        where: '${MuscleFields.name} = ?', whereArgs: [name]);
  }

  static Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    return await db?.insert(_tableName, row);
  }

  static Future<int?> update(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    int id = row["_id"];
    return await db?.update(_tableName, row,
        where: '$MuscleFields.id: ?', whereArgs: [id]);
  }

  static Future<int?> delete(int id) async {
    Database? db = await GymDB.instance.database;
    return await db
        ?.delete(_tableName, where: '$MuscleFields.id: ?', whereArgs: [id]);
  }
}
