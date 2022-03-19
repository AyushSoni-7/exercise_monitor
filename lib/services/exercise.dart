import 'package:exercise_monitor/models/exercise.dart';

List<Exercise> exerciseList = [
  Exercise(
      id: "1",
      name: "Flat Bench Press",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
  Exercise(
      id: "2",
      name: "Deadlift",
      imgSrc: "assets/images/deadlift.png",
      muscleId: "1"),
  Exercise(
      id: "3",
      name: "Incline Bench Press",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
  Exercise(
      id: "4",
      name: "Cable crossover",
      imgSrc: "assets/images/deadlift.png",
      muscleId: "1"),
  Exercise(
      id: "5",
      name: "Chest dip",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
  Exercise(
      id: "6",
      name: "Band pullover",
      imgSrc: "assets/images/deadlift.png",
      muscleId: "1"),
  Exercise(
      id: "7",
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
  Exercise(
      id: "8",
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
  Exercise(
      id: "9",
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: "1"),
];

List<Exercise> getMuscle() {
  return exerciseList;
}

List<Exercise> getMuscleId(String id) {
  return exerciseList.where((element) => element.muscleId == id).toList();
}

Exercise? getExerciseById(String id) {
  if (exerciseList.isNotEmpty) {
    return exerciseList.firstWhere((element) => element.id == id);
  }
  return null;
}
