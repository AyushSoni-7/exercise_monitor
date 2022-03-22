import 'package:exercise_monitor/models/sets.dart';
import 'dart:math';
import 'dart:convert';

Map<int, Sets> weekSetsList = {};

int getRandInt(int len) {
  Random random = new Random();
  return random.nextInt(10000);
}

Sets? updateSet(int scheduleId, int nSet) {
  if (weekSetsList[scheduleId] != null) {
    weekSetsList[scheduleId]!.nSet = nSet;
  } else {
    weekSetsList[scheduleId] =
        Sets(id: getRandInt(5), scheduleId: scheduleId, nSet: nSet);
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
