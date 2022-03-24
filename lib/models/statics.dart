import 'package:exercise_monitor/models/sets.dart';

class SetRepStat {
  DateTime date;
  // List<double> weight;
  // List<int> reps;
  List<Reps> listRep;
  SetRepStat({required this.date, required this.listRep});
}

class IndexData {
  DateTime date;
  int setXreps;
  IndexData({required this.date, required this.setXreps});
}
