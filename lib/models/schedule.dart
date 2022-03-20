class ScheduleExercise {
  String id;
  String exerciseId;
  DateTime date;
  bool done;
  ScheduleExercise(
      {required this.id,
      required this.exerciseId,
      required this.date,
      this.done = false});

  factory ScheduleExercise.fromJson(Map<String, dynamic> json) {
    return ScheduleExercise(
        id: json["id"],
        exerciseId: json['exerciseId'],
        date: json["date"],
        done: json["select"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["exerciseId"] = exerciseId;
    data["date"] = date;
    data["select"] = done;
    return data;
  }
}
