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

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
        id: json["_id"],
        name: json["name"],
        imgSrc: json["imgSrc"],
        muscleId: json["muscleId"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["imgSrc"] = imgSrc;
    data["muscleId"] = muscleId;
    return data;
  }
}

class ExerciseFields {
  static const String id = "_id";
  static const String name = "name";
  static const String imgSrc = "imgSrc";
  static const String muscleId = "muscleId";
}
