import 'package:exercise_monitor/models/sets.dart';

Map<String, Sets> weekSetsList = {};

Sets? updateSet(String scheduleId, int nSet) {
  if (weekSetsList[scheduleId] != null) {
    weekSetsList[scheduleId]!.nSet = nSet;
  } else {
    weekSetsList[scheduleId] = Sets(scheduleId: scheduleId, nSet: nSet);
  }
  return weekSetsList[scheduleId];
}

void updateReps(String scheduleId, int index, double weight, int rep) {
  if (weekSetsList[scheduleId] != null &&
      index < weekSetsList[scheduleId]!.reps.length) {
    weekSetsList[scheduleId]!.reps[index].rep = rep;
    weekSetsList[scheduleId]!.reps[index].weight = weight;
  } else if (weekSetsList[scheduleId] != null) {
    Reps newSet = Reps(weight: weight, rep: rep);
    weekSetsList[scheduleId]!.reps.add(newSet);
  } else {
    Reps newRep = Reps(weight: weight, rep: rep);
    weekSetsList[scheduleId]!.reps = <Reps>[
      newRep,
    ];
  }
}

Sets? getSetsBySchId(String schId) {
  return weekSetsList[schId];
}

Reps getRep(String schID, int index) {
  Sets? set = weekSetsList[schID];
  if (set != null && index < set.reps.length) {
    return set.reps[index];
  }
  return Reps(weight: 0, rep: 0);
}
