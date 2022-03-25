import 'package:exercise_monitor/db/schedule.dart';
import '../models/schedule.dart';

Future<int?> addSchExercise(Map<String, dynamic> exercise) {
  return SchExerciseDB.insert(exercise);
}

Future<List<ScheduleExercise>> getSchExerciseByDate(DateTime date) async {
  int filterDate =
      DateTime(date.year, date.month, date.day).microsecondsSinceEpoch;
  List<Map<String, dynamic>>? schExerciseJson =
      await SchExerciseDB.queryByDate(filterDate);
  List<ScheduleExercise> schExercise = [];
  for (var exercise in schExerciseJson!) {
    schExercise.add(ScheduleExercise.fromJson(exercise));
  }
  return Future.value(schExercise);
}

Future<ScheduleExercise?> getSchExerciseByDateExerID(
    int exerciseId, DateTime date) async {
  int filterDate =
      DateTime(date.year, date.month, date.day).microsecondsSinceEpoch;
  List<Map<String, dynamic>>? schExerciseList =
      await SchExerciseDB.queryByDateExID(exerciseId, filterDate);
  ScheduleExercise? schExercise;
  if (schExerciseList == null || schExerciseList.isEmpty) {
    return Future.value(null);
  }
  Map<String, dynamic> schExerMap = schExerciseList.elementAt(0);
  schExercise = ScheduleExercise.fromJson(schExerMap);
  return Future.value(schExercise);
}

Future<int?> exerciseDone(int schId) async {
  List<Map<String, dynamic>>? schDataList =
      await SchExerciseDB.queryBySchID(schId);
  Map<String, dynamic> data = Map.from(schDataList!.elementAt(0));
  data[ScheduleExerciseFields.done] = 1;
  return SchExerciseDB.update(data);
}
