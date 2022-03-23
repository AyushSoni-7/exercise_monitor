import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/exercise/reps.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:flutter/material.dart';

class SetsRepsWidget extends StatefulWidget {
  final ScheduleExercise schId;
  const SetsRepsWidget({Key? key, required this.schId}) : super(key: key);

  @override
  State<SetsRepsWidget> createState() => _SetsRepsWidgetState();
}

class _SetsRepsWidgetState extends State<SetsRepsWidget> {
  int defaultSet = 0;
  late int nset;

  late Sets? set;

  @override
  void initState() {
    super.initState();
    nset = defaultSet;
  }

  @override
  void dispose() {
    // Push your sets here
    super.dispose();
  }

  void getSets(int value) {
    setState(() {
      nset = value;
    });
    set = getSetsBySchId(widget.schId.id) ??
        updateSet(widget.schId.id, defaultSet);
    defaultSet = set!.nSet;
  }

  @override
  Widget build(BuildContext context) {
    set = getSetsBySchId(widget.schId.id) ??
        updateSet(widget.schId.id, defaultSet);
    defaultSet = set!.nSet;
    return SingleChildScrollView(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(top: 2, left: 40, bottom: 10, right: 0),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SetsWidget(
                returnSet: getSets,
                defaultSet: defaultSet,
              ),
              for (int i = 0; i < nset; i++)
                RepsWidget(scheduleId: set!.scheduleId, index: i),
            ],
          ),
        ),
      ),
    );
  }
}
