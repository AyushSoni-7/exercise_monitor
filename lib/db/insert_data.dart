import 'package:exercise_monitor/metadata/injection.dart';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:sqflite/sqflite.dart';
import 'package:exercise_monitor/models/muscle.dart';

Future insertMetadata(Database db) async {
  for (Muscle muscle in muscleGroup) {
    db.insert(muscleTable, muscle.toJson());
  }
  for (Exercise exercise in exerciseList) {
    db.insert(exerciseTable, exercise.toJson());
  }
}
