import 'package:exercise_monitor/models/sets.dart';

import 'package:exercise_monitor/pages/exercise/sets_reps.dart';
import 'package:exercise_monitor/pages/utility/hero_dialog_route.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/pages/week_calendar/card_title.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/exercise.dart';
import '../../models/schedule.dart';

const String _heroAddTodo = 'add-todo-hero';

class ToDoExerciseListWidget extends StatefulWidget {
  final ScheduleExercise schId;
  const ToDoExerciseListWidget({Key? key, required this.schId})
      : super(key: key);

  @override
  _ToDoExerciseListWidgetState createState() => _ToDoExerciseListWidgetState();
}

class _ToDoExerciseListWidgetState extends State<ToDoExerciseListWidget> {
  late Exercise? exercise;
  late bool isDone;
  bool editSelect = false;
  late Sets set;
  var temp;
  @override
  void initState() {
    super.initState();
    isDone = widget.schId.done;
  }

  getSetByID() async {
    return await getSetBySchId(widget.schId.id).then((value) => set = value);
  }

  void navigateAndGetValue(context) async {
    temp = await Navigator.of(context).push(HeroDialogRoute(builder: (context) {
      return FutureBuilder(
          future: getSetByID(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return SetsRepsWidget(set: snapshot.data);
            } else if (snapshot.hasError) {
              return const Text("Error");
            }
            return const Loader();
          });
    }));
    setState(() {
      if (temp == true) isDone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: isDone
                ? const Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: Colors.green,
                  )
                : const Icon(CupertinoIcons.circle),
            title: CardTitleWeekCalendar(
              schId: widget.schId,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              // Icon(editSelect
              //     ? CupertinoIcons.arrowtriangle_down_circle_fill
              //     : CupertinoIcons.arrowtriangle_right_circle_fill),
              onPressed: (() async => {navigateAndGetValue(context)}),
            ),
          ),
        ),
      ],
    );
  }
}
