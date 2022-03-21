const String muscleTable = "muscle";

class Muscle {
  int id;
  String name;
  String imgSrc;

  Muscle({required this.id, required this.name, required this.imgSrc});
}

class MuscleFields {
  static const String id = "_id";
  static const String name = "name";
  static const String imgSrc = "imgSrc";
}
