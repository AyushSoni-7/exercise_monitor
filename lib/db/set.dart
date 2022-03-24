import 'package:exercise_monitor/db/gym_db.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:sqflite/sqflite.dart';

mixin SetDB implements GymDB {
  static const _tableName = setTable;

  static Future<List<Map<String, dynamic>>?> queryAll() async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>?> queryBySchID(int schId) async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName,
        where: '${SetTableFields.scheduleId} = ?',
        whereArgs: [schId],
        orderBy: '${SetTableFields.setNum}  ASC');
  }

  static Future<List<Map<String, dynamic>>?> querySchIdIndex(
      int scheduleId, int index) async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName,
        where:
            '${SetTableFields.scheduleId} = ? and ${SetTableFields.setNum} = ?',
        whereArgs: [scheduleId, index],
        limit: 1);
  }

  static Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    return await db?.insert(_tableName, row);
  }

  static Future<int?> update(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    int id = row["_id"];
    return await db?.update(_tableName, row,
        where: '$SetTableFields.id: ?', whereArgs: [id]);
  }

  static Future<int?> updateBySchidIndex(Map<String, dynamic> row) async {
    Database? db = await GymDB.instance.database;
    int schId = row[SetTableFields.scheduleId];
    int index = row[SetTableFields.setNum];
    return await db?.update(_tableName, row,
        where:
            '${SetTableFields.scheduleId} = ? and ${SetTableFields.setNum} = ?',
        whereArgs: [schId, index]);
  }

  static Future<int?> delete(int id) async {
    Database? db = await GymDB.instance.database;
    return await db
        ?.delete(_tableName, where: '${SetTableFields.id}: ?', whereArgs: [id]);
  }

  static Future<int?> deleteBySchID(int schId) async {
    Database? db = await GymDB.instance.database;
    return await db?.delete(_tableName,
        where: '${SetTableFields.scheduleId} = ?', whereArgs: [schId]);
  }
}
