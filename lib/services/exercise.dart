import 'package:exercise_monitor/db/exercise.dart';
import 'package:exercise_monitor/models/exercise.dart';

Future<List<Exercise>> getByMuscleId(int id) async {
  List<Exercise> exerciseDataList = [];
  List<Map<String, dynamic>>? exerciseData =
      await ExerciseDB.queryByMuscleID(id);
  for (var exercise in exerciseData!) {
    exerciseDataList.add(Exercise.fromJson(exercise));
  }
  return Future.value(exerciseDataList);
}

Future<Exercise?> getExerciseById(int id) async {
  List<Map<String, dynamic>>? exerciseList =
      await ExerciseDB.queryByExerciseID(id);
  Exercise exercise;
  if (exerciseList!.isNotEmpty) {
    exercise = Exercise.fromJson(exerciseList[0]);
    return exercise;
  }
  return null;
}
