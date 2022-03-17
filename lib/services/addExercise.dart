import 'dart:developer';

import 'package:collection/collection.dart';
import '../models/schedule.dart';

int count = 0;

List<ScheduleExercise> todoExercise = [];

void addExercise(ScheduleExercise exercise) {
  todoExercise.add(exercise);
}

List<ScheduleExercise> filterByDate(DateTime date) {
  return todoExercise
      .where((element) => daysBetween(date, element.date) < 1)
      .toList();
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

ScheduleExercise? getExercise(String exerciseId, DateTime date) {
  return todoExercise.firstWhereOrNull((element) =>
      element.exercise_id == exerciseId && daysBetween(date, element.date) < 1);
}

ScheduleExercise objSchExercise(String exerciseId, DateTime date) {
  count += 1;
  return ScheduleExercise(
      id: count.toString(), exercise_id: exerciseId, date: date);
}
