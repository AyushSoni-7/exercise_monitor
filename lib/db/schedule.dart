import 'package:exercise_monitor/db/gym_db.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:sqflite/sqflite.dart';

mixin SchExerciseDB implements GymDB {
  static const _tableName = schExerciseTable;

  static Future<List<Map<String, dynamic>>?> queryAll() async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>?> queryByDate(int date) async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName,
        where: '${ScheduleExerciseFields.date} = ?', whereArgs: [date]);
  }

  static Future<List<Map<String, dynamic>>?> queryByDateExID(
      int exerciseID, int date) async {
    Database? db = await GymDB.instance.database;
    return await db?.query(_tableName,
        where:
            '${ScheduleExerciseFields.date} = ? and ${ScheduleExerciseFields.exerciseId} = ?',
        whereArgs: [date, exerciseID],
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
        where: '$ScheduleExerciseFields.id: ?', whereArgs: [id]);
  }

  static Future<int?> delete(int id) async {
    Database? db = await GymDB.instance.database;
    return await db?.delete(_tableName,
        where: '$ScheduleExerciseFields.id: ?', whereArgs: [id]);
  }
}
