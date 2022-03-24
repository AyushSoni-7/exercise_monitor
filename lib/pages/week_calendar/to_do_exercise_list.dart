import 'package:exercise_monitor/models/sets.dart';

import 'package:exercise_monitor/pages/exercise/sets_reps.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/pages/week_calendar/card_title.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/exercise.dart';
import '../../models/schedule.dart';

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
  late Sets set;

  @override
  void initState() {
    super.initState();
    isDone = widget.schId.done;
  }

  getSetByID() async {
    return await getSetBySchId(widget.schId.id).then((value) => set = value);
  }

  @override
  Widget build(BuildContext context) {
    isDone = widget.schId.done;
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
            title: CardTitleWeekCalendar(
              schId: widget.schId,
            ),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    isDone = true;
                    exerciseDone(widget.schId);
                  });
                }),
                icon: isDone
                    ? const Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: Colors.green,
                      )
                    : const Icon(CupertinoIcons.circle)),
          ),
        ),
        editSelect == true
            ? FutureBuilder(
                future: getSetByID(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return SetsRepsWidget(set: snapshot.data);
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return const Loader();
                })
            : const SizedBox.shrink(),
      ],
    );
  }
}
