import 'package:exercise_monitor/db/muscle.dart';
import '../models/muscle.dart';

List<Muscle> muscleGroup = [
  Muscle(id: 1, name: "Chest", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 1, name: "Tricep", imgSrc: "assets/images/back.jpg"),
  Muscle(id: 1, name: "Back", imgSrc: "assets/images/back.jpg"),
  Muscle(id: 1, name: "Bicep", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 1, name: "Core", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 1, name: "Abs", imgSrc: "assets/images/front.jpg"),
  Muscle(id: 2, name: "Legs", imgSrc: "assets/images/front.jpg"),
];

Future<List<Muscle>> getMuscleGroup() async {
  // return muscleGroup;
  List<Muscle> muscleGroupData = [];
  List<Map<String, dynamic>>? muscleData = await MuscleDB.queryAll();
  for (var muscle in muscleData!) {
    muscleGroupData.add(Muscle.fromJson(muscle));
  }
  return muscleGroupData;
}
