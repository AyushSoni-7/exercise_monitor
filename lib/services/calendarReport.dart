import 'package:exercise_monitor/models/calendarReport.dart';
import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/exercise.dart';

List<CalendarReport> calendarReport = [];

void setCalendarReport(DateTime date) {
  DateTime firstDayofMonth = DateTime(date.year, date.month, 1);
  List<ScheduleExercise> monthExercises = todoExercise
      .where((element) => firstDayofMonth.isBefore(element.date))
      .toList();
  Map<DateTime, double> dateTotal = {};
  Map<DateTime, double> doneTotal = {};
  for (ScheduleExercise schExercise in monthExercises) {
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
  dateTotal.forEach((date, total) {
    double done = 0.0;
    if (doneTotal.containsKey(date)) {
      done = doneTotal[date]!;
    }
    calendarReport
        .add(CalendarReport(date: date, percentageDone: (done * 100) / total));
  });
}

Future<List<CalendarExerciseReport>> getExercisesReport(DateTime date) async {
  List<CalendarExerciseReport> calExerciseReport = [];
  List<ScheduleExercise> schExercises = filterByDate(date);
  for (ScheduleExercise schExercise in schExercises) {
    Exercise exercise =
        await getExerciseById(schExercise.exerciseId) as Exercise;

    CalendarExerciseReport calExRepo =
        CalendarExerciseReport(exercise: exercise, schExercise: schExercise);
    calExerciseReport.add(calExRepo);
  }
  return calExerciseReport;
}
