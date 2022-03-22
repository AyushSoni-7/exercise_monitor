import 'package:exercise_monitor/db/exercise.dart';
import 'package:exercise_monitor/models/exercise.dart';

List<Exercise> exerciseList = [
  Exercise(
      id: 1,
      name: "Flat Bench Press",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
  Exercise(
      id: 2,
      name: "Deadlift",
      imgSrc: "assets/images/deadlift.png",
      muscleId: 1),
  Exercise(
      id: 3,
      name: "Incline Bench Press",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
  Exercise(
      id: 4,
      name: "Cable crossover",
      imgSrc: "assets/images/deadlift.png",
      muscleId: 1),
  Exercise(
      id: 5,
      name: "Chest dip",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
  Exercise(
      id: 6,
      name: "Band pullover",
      imgSrc: "assets/images/deadlift.png",
      muscleId: 1),
  Exercise(
      id: 7,
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
  Exercise(
      id: 8,
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
  Exercise(
      id: 9,
      name: "Pushup",
      imgSrc: "assets/images/flat_bench_press.png",
      muscleId: 1),
];

Future<List<Exercise>> getByMuscleId(int id) async {
  List<Exercise> exerciseDataList = [];
  List<Map<String, dynamic>>? exerciseData =
      await ExerciseDB.queryByMuscleID(id);
  for (var exercise in exerciseData!) {
    exerciseDataList.add(Exercise.fromJson(exercise));
  }
  return Future.value(exerciseDataList);
  // return exerciseList.where((element) => element.muscleId == id).toList();
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
