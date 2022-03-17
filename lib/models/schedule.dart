

class ScheduleExercise {
  String id;
  String exercise_id;
  DateTime date;
  bool done;
  ScheduleExercise(
      {required this.id,
      required this.exercise_id,
      required this.date,
      this.done = false});

  factory ScheduleExercise.fromJson(Map<String, dynamic> json) {
    return ScheduleExercise(
        id: json["id"],
        exercise_id: json['exercise_id'],
        date: json["date"],
        done: json["select"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["exercise_id"] = exercise_id;
    data["date"] = date;
    data["select"] = done;
    return data;
  }
}
