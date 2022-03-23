import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/exercise/reps.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:exercise_monitor/pages/exercise/sets_reps.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/pages/week_calendar/card_title.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/sets.dart';
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
    isDone = widget.schId.done;
    set = getSetsBySchId(widget.schId.id) ??
        updateSet(widget.schId.id, defaultSet);
    defaultSet = set!.nSet;
    // ends here
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
                    exerciseDone(widget.schId.id);
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
            ? SetsRepsWidget(schId: widget.schId)
            // SingleChildScrollView(
            //     child: Card(
            //       elevation: 0,
            //       margin: const EdgeInsets.only(
            //           top: 2, left: 40, bottom: 10, right: 0),
            //       child: ListTile(
            //         title: Column(
            //           crossAxisAlignment: CrossAxisAlignment.stretch,
            //           children: [
            //             SetsWidget(
            //               returnSet: getSets,
            //               defaultSet: defaultSet,
            //             ),
            //             for (int i = 0; i < set!.nSet; i++)
            //               RepsWidget(scheduleId: set!.scheduleId, index: i),
            //           ],
            //         ),
            //       ),
            //     ),
            //   )
            : const SizedBox.shrink(),
      ],
    );
  }
}
