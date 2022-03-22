const String schExerciseTable = "scheduleExercise";

class ScheduleExercise {
  int id;
  int exerciseId;
  DateTime date;
  bool done;
  ScheduleExercise(
      {required this.id,
      required this.exerciseId,
      required this.date,
      this.done = false});

  factory ScheduleExercise.fromJson(Map<String, dynamic> json) {
    return ScheduleExercise(
        id: json["_id"],
        exerciseId: json["exerciseId"],
        date: DateTime.fromMicrosecondsSinceEpoch(json["date"]),
        done: json["done"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["exerciseId"] = exerciseId;
    data["date"] = date.microsecondsSinceEpoch;
    data["done"] = done;
    return data;
  }
}

class ScheduleExerciseFields {
  static const String id = "_id";
  static const String exerciseId = "exerciseId";
  static const String date = "date";
  static const String done = "done";
}
