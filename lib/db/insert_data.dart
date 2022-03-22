import 'package:sqflite/sqflite.dart';
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

Future insertMetadata(Database db) async {
  for (Muscle muscle in muscleGroup) {
    db.insert(muscleTable, muscle.toJson());
  }
}
