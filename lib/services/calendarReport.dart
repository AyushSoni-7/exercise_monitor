import 'package:exercise_monitor/db/schedule.dart';
import 'package:exercise_monitor/models/calendarReport.dart';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/exercise.dart';

Future<List<CalendarReport>> getCalendarReport(DateTime date) async {
  int firstDayofMonth =
      DateTime(date.year, date.month, 1).microsecondsSinceEpoch;
  int lastDayofMonth =
      DateTime(date.year, date.month + 1, 0).microsecondsSinceEpoch;
  List<Map<String, dynamic>>? schExerciseMapData =
      await SchExerciseDB.queryByDateRange(firstDayofMonth, lastDayofMonth);
  List<ScheduleExercise> schExercise = [];
  for (var exercise in schExerciseMapData!) {
    schExercise.add(ScheduleExercise.fromJson(exercise));
  }

  Map<DateTime, double> dateTotal = {};
  Map<DateTime, double> doneTotal = {};
  for (ScheduleExercise schExercise in schExercise) {
    DateTime date = DateTime(
        schExercise.date.year, schExercise.date.month, schExercise.date.day);
    if (dateTotal.containsKey(date)) {
      dateTotal[date] = (dateTotal[date])! + 1;
    } else {
      dateTotal[date] = 1;
    }
    if (schExercise.done == true) {
      if (doneTotal.containsKey(date)) {
        doneTotal[date] = (doneTotal[date])! + 1;
      } else {
        doneTotal[date] = 1;
      }
    }
  }
  List<CalendarReport> calendarReport = [];
  dateTotal.forEach((date, total) {
    double done = 0.0;
    if (doneTotal.containsKey(date)) {
      done = doneTotal[date]!;
    }
    calendarReport
        .add(CalendarReport(date: date, percentageDone: (done * 100) / total));
  });
  return Future.value(calendarReport);
}

Future<List<CalendarExerciseReport>> getExercisesReport(DateTime date) async {
  List<CalendarExerciseReport> calExerciseReport = [];
  List<ScheduleExercise> schExercises = await getSchExerciseByDate(date);
  for (ScheduleExercise schExercise in schExercises) {
    Exercise exercise =
        await getExerciseById(schExercise.exerciseId) as Exercise;

    CalendarExerciseReport calExRepo =
        CalendarExerciseReport(exercise: exercise, schExercise: schExercise);
    calExerciseReport.add(calExRepo);
  }
  return calExerciseReport;
}
