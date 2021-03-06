import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/exercise/reps.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:exercise_monitor/pages/week_calendar/click_button.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/material.dart';

const String _heroAddTodo = 'add-todo-hero';

class SetsRepsWidget extends StatefulWidget {
  final Sets set;
  const SetsRepsWidget({Key? key, required this.set}) : super(key: key);

  @override
  State<SetsRepsWidget> createState() => _SetsRepsWidgetState();
}

class _SetsRepsWidgetState extends State<SetsRepsWidget> {
  late int nset;

  late Sets set;

  @override
  void initState() {
    set = widget.set;
    super.initState();
  }

  @override
  void dispose() {
    // addOrUpdateSet(set);
    super.dispose();
  }

  getSets(int value) {
    setState(() {
      if (value > 0) {
        set.reps.add(Reps(weight: 0, rep: 0));
      } else {
        set.reps.removeLast();
      }
      set.nSet = set.reps.length;
    });
  }

  getReps(Reps rep, int index) {
    set.reps.elementAt(index).rep = rep.rep;
    set.reps.elementAt(index).weight = rep.weight;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 32.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.42,
          child: Card(
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Sets",
                      style: subHeadingStyle,
                    ),
                  ),
                  SetsWidget(
                    returnSet: getSets,
                    defaultSet: set.reps.length,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            for (int i = 0; i < set.reps.length; i++)
                              RepsWidget(set: set, index: i, returnRep: getReps)
                          ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white, // foreground
                        ),
                        onPressed: () {
                          addOrUpdateSet(set);
                          exerciseDone(set.scheduleId);
                          Navigator.pop(context, true);
                        },
                        child: const Text('Done'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
