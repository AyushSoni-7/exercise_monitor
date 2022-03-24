const String setTable = "setTable";

class Sets {
  int scheduleId;
  int nSet;
  List<Reps> reps = [];
  Sets({required this.scheduleId, required this.nSet, reps});

  factory Sets.fromJson(Map<String, dynamic> json) {
    return Sets(
        scheduleId: json["scheduleId"], nSet: json["nSet"], reps: json["reps"]);
  }

  Map<String, dynamic> toJson(int index) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["scheduleId"] = scheduleId;
    data["nSet"] = nSet;
    data["reps"] = reps;
    return data;
  }
}

// ${SetTableFields.weight} $_doubleType
class Reps {
  int weight;
  int rep;
  Reps({required this.weight, required this.rep});

  factory Reps.fromJson(Map<String, dynamic> json) {
    return Reps(weight: json["weight"], rep: json["rep"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["weight"] = weight;
    data["rep"] = rep;
    return data;
  }
}

class SetTableFields {
  static const String id = "_id";
  static const String scheduleId = "scheduleId";
  static const String setNum = "setNum";
  static const String rep = "rep";
  static const String weight = "weight";
}
