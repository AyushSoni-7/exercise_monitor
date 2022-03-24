import 'dart:math';
import 'package:exercise_monitor/db/schedule.dart';
import 'package:exercise_monitor/db/set.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/models/statics.dart';

int getMaxsets(List<SetRepStat> setRepStatData) {
  int maxSets = 0;
  for (SetRepStat setRepStat in setRepStatData) {
    maxSets = max(maxSets, setRepStat.listRep.length);
  }
  return maxSets;
}

List<IndexData> getDataIndex(List<SetRepStat> setRepStatData, int set) {
  List<IndexData> data = [];
  for (SetRepStat setRepStat in setRepStatData) {
    if (setRepStat.listRep.length > set) {
      Reps rep = setRepStat.listRep.elementAt(set);
      data.add(
          IndexData(date: setRepStat.date, setXreps: rep.rep * rep.weight));
    }
  }
  return data;
}

Future<List<SetRepStat>> getsetRepStatData(int exerciseID) async {
  List<SetRepStat> setRepData = [];
  List<Map<String, dynamic>>? schExerciseData =
      await SchExerciseDB.queryByExerciseID(exerciseID);
  for (var schExercise in schExerciseData!) {
    List<Map<String, dynamic>>? setData =
        await SetDB.queryBySchID(schExercise[ScheduleExerciseFields.id]);
    List<Reps> repList = [];
    for (var set in setData!) {
      repList.add(Reps(
          weight: set[SetTableFields.weight], rep: set[SetTableFields.rep]));
    }
    setRepData.add(SetRepStat(
        date: DateTime.fromMicrosecondsSinceEpoch(
            schExercise[ScheduleExerciseFields.date]),
        listRep: repList));
  }
  return Future.value(setRepData);
}
