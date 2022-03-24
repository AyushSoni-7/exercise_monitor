import 'package:exercise_monitor/db/insert_data.dart';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/muscle.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:sqflite/sqflite.dart';

Future createTable(Database db, int version) async {
  const _idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
  const _textType = "TEXT NOT NULL";
  // const _boolType = "BOOLEAN NOT NULL";
  const _intType = "INTEGER NOT NULL";
  const _doubleType = "REAL NOT NULL";
  // Muscle table
  await db.execute('''
      CREATE TABLE $muscleTable (
        ${MuscleFields.id} $_idType,
        ${MuscleFields.name} $_textType,
        ${MuscleFields.imgSrc} $_textType
      )
      ''');

  // Exercise table
  await db.execute('''
      CREATE TABLE $exerciseTable (
        ${ExerciseFields.id} $_idType,
        ${ExerciseFields.name} $_textType,
        ${ExerciseFields.imgSrc} $_textType,
        ${ExerciseFields.muscleId} $_intType
      )
      ''');

  // Schedule Table
  db.execute('''
      CREATE TABLE $schExerciseTable (
        ${ScheduleExerciseFields.id} $_idType,
        ${ScheduleExerciseFields.exerciseId} $_intType,
        ${ScheduleExerciseFields.date} $_intType,
        ${ScheduleExerciseFields.done} $_intType
      )
      ''');
  // ${SetTableFields.weight} $_doubleType
  // Sets Reps
  db.execute('''
      CREATE TABLE $setTable (
        ${SetTableFields.id} $_idType,
        ${SetTableFields.scheduleId} $_intType,
        ${SetTableFields.setNum} $_intType,
        ${SetTableFields.rep} $_intType,
        ${SetTableFields.weight} $_intType
        
      )
      ''');

  insertMetadata(db);
}
