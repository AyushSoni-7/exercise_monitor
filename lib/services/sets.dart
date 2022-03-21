import 'package:exercise_monitor/models/sets.dart';

Map<int, Sets> weekSetsList = {};

Sets? updateSet(int scheduleId, int nSet) {
  if (weekSetsList[scheduleId] != null) {
    weekSetsList[scheduleId]!.nSet = nSet;
  } else {
    weekSetsList[scheduleId] = Sets(scheduleId: scheduleId, nSet: nSet);
  }
  return weekSetsList[scheduleId];
}

void updateReps(int scheduleId, int index, double weight, int rep) {
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

Sets? getSetsBySchId(int schId) {
  return weekSetsList[schId];
}

Reps getRep(int schID, int index) {
  Sets? set = weekSetsList[schID];
  if (set != null && index < set.reps.length) {
    return set.reps[index];
  }
  return Reps(weight: 0, rep: 0);
}
