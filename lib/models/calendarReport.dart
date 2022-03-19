// ignore: file_names
import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';

class CalendarReport {
  DateTime date;
  double percentageDone;

  CalendarReport({required this.date, required this.percentageDone});
}

class CalendarExerciseReport {
  Exercise exercise;
  ScheduleExercise schExercise;
  CalendarExerciseReport({required this.exercise, required this.schExercise});
}
