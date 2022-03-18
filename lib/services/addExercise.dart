import 'dart:developer';
import 'dart:math';
import 'dart:convert';
import 'package:collection/collection.dart';
import '../models/schedule.dart';

int count = 0;

List<ScheduleExercise> todoExercise = [];


String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) =>  random.nextInt(255));
  return base64UrlEncode(values);
}

void addExercise(ScheduleExercise exercise) {
  exercise.id = getRandString(5);
  todoExercise.add(exercise);
}

List<ScheduleExercise> filterByDate(DateTime date) {
  return todoExercise
      .where((element) => daysBetween(date, element.date) == 0)
      .toList();
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);

  return to.compareTo(from);
}

ScheduleExercise? getExercise(String exerciseId, DateTime date) {
  return todoExercise.firstWhereOrNull((element) =>
      element.exercise_id == exerciseId && daysBetween(date, element.date) == 0);
}

ScheduleExercise objSchExercise(String exerciseId, DateTime date) {
  count += 1;
  return ScheduleExercise(
      id: count.toString(), exercise_id: exerciseId, date: date);
}
