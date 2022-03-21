const String exerciseTable = "exercise";

class Exercise {
  int id;
  String name;
  String imgSrc;
  int muscleId;

  Exercise(
      {required this.id,
      required this.name,
      required this.imgSrc,
      required this.muscleId});
}

class ExerciseFields {
  static const String id = "_id";
  static const String name = "name";
  static const String imgSrc = "imgSrc";
  static const String muscleId = "muscleId";
}
