import 'package:exercise_monitor/db/muscle.dart';
import '../models/muscle.dart';

Future<List<Muscle>> getMuscleGroup() async {
  List<Muscle> muscleGroupData = [];
  List<Map<String, dynamic>>? muscleData = await MuscleDB.queryAll();
  for (var muscle in muscleData!) {
    muscleGroupData.add(Muscle.fromJson(muscle));
  }
  return muscleGroupData;
}
