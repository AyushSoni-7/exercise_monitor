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

List<Muscle> getMuscle() {
  return muscleGroup;
}
