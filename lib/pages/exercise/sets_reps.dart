import 'dart:math';

import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/exercise/reps.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:flutter/material.dart';

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
    addOrUpdateSet(set);
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
                defaultSet: set.reps.length,
              ),
              for (int i = 0; i < set.reps.length; i++)
                RepsWidget(set: set, index: i, returnRep: getReps),
            ],
          ),
        ),
      ),
    );
  }
}
