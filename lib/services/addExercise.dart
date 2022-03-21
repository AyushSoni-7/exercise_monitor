import 'dart:math';
import 'dart:convert';
import 'package:collection/collection.dart';
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

int getRandString(int len) {
  Random random = new Random();
  return random.nextInt(10000);
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

ScheduleExercise? getExercise(int exerciseId, DateTime date) {
  return todoExercise.firstWhereOrNull((element) =>
      element.exerciseId == exerciseId && daysBetween(date, element.date) == 0);
}

ScheduleExercise objSchExercise(int exerciseId, DateTime date) {
  count += 1;
  return ScheduleExercise(id: count, exerciseId: exerciseId, date: date);
}

void exerciseDone(int id) {
  ScheduleExercise schExercise =
      todoExercise.firstWhere((element) => element.id == id);
  schExercise.done = true;
}
