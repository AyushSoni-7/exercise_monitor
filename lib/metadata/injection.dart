import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/muscle.dart';

List<Muscle> muscleGroup = [
  Muscle(id: 1, name: "Chest", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 2, name: "Tricep", imgSrc: "assets/images/back.jpg"),
  Muscle(id: 3, name: "Back", imgSrc: "assets/images/back.jpg"),
  Muscle(id: 4, name: "Bicep", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 5, name: "Core", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 6, name: "Abs", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 7, name: "Legs", imgSrc: "assets/images/front.jpg"),
];

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
