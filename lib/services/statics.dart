import 'dart:math';
import 'package:exercise_monitor/models/statics.dart';

List<SetRepStat> setRepStatData = [
  SetRepStat(date: DateTime(2022, 1, 10), weight: [7.5], reps: [10]),
  SetRepStat(date: DateTime(2022, 1, 15), weight: [7.5, 10], reps: [12, 10]),
  SetRepStat(
      date: DateTime(2022, 1, 15), weight: [7.5, 10, 12.5], reps: [12, 10, 8]),
  SetRepStat(
      date: DateTime(2022, 1, 30), weight: [7.5, 10, 12.5], reps: [12, 10, 10]),
  SetRepStat(
      date: DateTime(2022, 2, 10), weight: [7.5, 10, 12.5], reps: [12, 10, 10]),
  SetRepStat(
      date: DateTime(2022, 2, 12),
      weight: [7.5, 10, 12.5, 15],
      reps: [12, 10, 10, 5]),
];

int getMaxsets() {
  int maxSets = 0;
  for (SetRepStat setRepStat in setRepStatData) {
    maxSets = max(maxSets, setRepStat.reps.length);
  }
  return maxSets;
}

List<IndexData> getDataIndex(int set) {
  List<IndexData> data = [];
  for (SetRepStat setRepStat in setRepStatData) {
    if (setRepStat.reps.length > set && setRepStat.weight.length > set) {
      data.add(IndexData(
          date: setRepStat.date,
          setXreps: setRepStat.reps.elementAt(set) *
              setRepStat.weight.elementAt(set)));
    }
  }
  return data;
}
