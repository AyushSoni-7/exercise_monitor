const String muscleTable = "muscle";

class Muscle {
  int id;
  String name;
  String imgSrc;

  Muscle({required this.id, required this.name, required this.imgSrc});

  factory Muscle.fromJson(Map<String, dynamic> json) {
    return Muscle(id: json["_id"], name: json["name"], imgSrc: json["imgSrc"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    data["imgSrc"] = imgSrc;
    return data;
  }
}

class MuscleFields {
  static const String id = "_id";
  static const String name = "name";
  static const String imgSrc = "imgSrc";
}
