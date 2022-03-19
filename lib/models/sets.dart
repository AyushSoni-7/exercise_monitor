class Sets {
  String scheduleId;
  int nSet;
  List<Reps> reps = [];
  Sets({required this.scheduleId, required this.nSet});
}

class Reps {
  double weight;
  int rep;
  Reps({required this.weight, required this.rep});
}
