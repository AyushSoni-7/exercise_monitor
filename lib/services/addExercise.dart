import 'package:exercise_monitor/db/schedule.dart';
import '../models/schedule.dart';

int count = 0;

List<ScheduleExercise> todoExercise = [
  ScheduleExercise(
      id: 1000, exerciseId: 5, date: DateTime(2022, 02, 16), done: true),
  ScheduleExercise(
      id: 2000,
      exerciseId: 1,
      date: DateTime.now().subtract(const Duration(days: 1)),
      done: true),
  ScheduleExercise(
      id: 3000,
      exerciseId: 2,
      date: DateTime.now().subtract(const Duration(days: 1)),
      done: false),
  ScheduleExercise(
      id: 4000,
      exerciseId: 3,
      date: DateTime.now().subtract(const Duration(days: 2)),
      done: true),
  ScheduleExercise(
      id: 4500,
      exerciseId: 4,
      date: DateTime.now().subtract(const Duration(days: 2)),
      done: true),
  ScheduleExercise(
      id: 4700,
      exerciseId: 5,
      date: DateTime.now().subtract(const Duration(days: 2)),
      done: true),
  ScheduleExercise(
      id: 4800,
      exerciseId: 6,
      date: DateTime.now().subtract(const Duration(days: 3)),
      done: true),
  ScheduleExercise(
      id: 5000,
      exerciseId: 1,
      date: DateTime.now().subtract(const Duration(days: 3)),
      done: false),
  ScheduleExercise(
      id: 5200,
      exerciseId: 1,
      date: DateTime.now().subtract(const Duration(days: 3)),
      done: false),
  ScheduleExercise(
      id: 5400,
      exerciseId: 1,
      date: DateTime.now().subtract(const Duration(days: 3)),
      done: false),
];

Future<int?> addSchExercise(Map<String, dynamic> exercise) {
  return SchExerciseDB.insert(exercise);
}

Future<List<ScheduleExercise>> getSchExerciseByDate(DateTime date) async {
  int filterDate =
      DateTime(date.year, date.month, date.day).microsecondsSinceEpoch;
  List<Map<String, dynamic>>? schExerciseJson =
      await SchExerciseDB.queryByDate(filterDate);
  // if (schExerciseJson == null || schExerciseJson.isEmpty) {
  //   return Future.value(null);
  // }
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

Future<int?> exerciseDone(ScheduleExercise schId) {
  Map<String, dynamic> data = schId.toJson();
  data[ScheduleExerciseFields.done] = 1;
  return SchExerciseDB.update(data);
}
