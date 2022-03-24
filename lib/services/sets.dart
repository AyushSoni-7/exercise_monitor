import 'package:exercise_monitor/db/set.dart';
import 'package:exercise_monitor/models/sets.dart';

Future<Sets> getSetBySchId(int schId) async {
  List<Map<String, dynamic>>? setList = await SetDB.queryBySchID(schId);
  List<Reps> reps = [];

  if (setList == null || setList.isEmpty) {
    return Future.value(Sets(scheduleId: schId, nSet: 0));
  }
  for (var repMap in setList) {
    reps.add(Reps(weight: repMap["weight"], rep: repMap["rep"]));
  }
  int nSet = reps.length;
  Sets set = Sets(scheduleId: schId, nSet: nSet);
  set.reps = reps;
  return set;
}

Future addOrUpdateSet(Sets set) async {
  await SetDB.deleteBySchID(set.scheduleId);
  int index = 0;
  for (Reps rep in set.reps) {
    Map<String, dynamic> row = {
      SetTableFields.scheduleId: set.scheduleId,
      SetTableFields.setNum: index,
      SetTableFields.rep: rep.rep,
      SetTableFields.weight: rep.weight
    };
    await SetDB.insert(row);
    index++;
  }
  List<Map<String, dynamic>>? setList =
      await SetDB.queryBySchID(set.scheduleId);
}
