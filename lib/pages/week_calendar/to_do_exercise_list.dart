import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/exercise/reps.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/exercise.dart';
import '../../models/schedule.dart';
import '../../services/exercise.dart';

class ToDoExerciseListWidget extends StatefulWidget {
  final ScheduleExercise schId;
  const ToDoExerciseListWidget({Key? key, required this.schId})
      : super(key: key);

  @override
  _ToDoExerciseListWidgetState createState() => _ToDoExerciseListWidgetState();
}

class _ToDoExerciseListWidgetState extends State<ToDoExerciseListWidget> {
  late Exercise? exercise;
  bool isDone = false;
  bool editSelect = false;
  int defaultSet = 0;
  // late int nset;
  late Sets? set;

  @override
  void initState() {
    super.initState();
    exercise = getExerciseId(widget.schId.exercise_id);
    isDone = widget.schId.done;
    set = getSetsBySchId(widget.schId.id) ??
        updateSet(widget.schId.id, defaultSet);
    defaultSet = set!.nSet;
  }

  void getSets(int value) {
    setState(() {
      set = updateSet(widget.schId.id, value);
    });
    defaultSet = set!.nSet;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: IconButton(
              icon: Icon(editSelect
                  ? CupertinoIcons.arrowtriangle_down_circle_fill
                  : CupertinoIcons.arrowtriangle_right_circle_fill),
              onPressed: (() => {
                    setState(() {
                      editSelect = !editSelect;
                    })
                  }),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(exercise!.imgSrc.toString()),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(exercise!.name.toString(),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    isDone = true;
                  });
                }),
                icon: Icon(isDone
                    ? CupertinoIcons.check_mark_circled_solid
                    : CupertinoIcons.circle)),
          ),
        ),
        editSelect == true
            ? SingleChildScrollView(
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(
                      top: 2, left: 40, bottom: 10, right: 0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SetsWidget(
                          returnSet: getSets,
                          defaultSet: defaultSet,
                        ),
                        for (int i = 0; i < set!.nSet; i++)
                          RepsWidget(scheduleId: set!.scheduleId, index: i),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(width: 0.0, height: 0.0),
      ],
    );
  }
}
