import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/exercise.dart';
import '../../models/schedule.dart';
import '../../services/addExercise.dart';

class AddExercise extends StatefulWidget {
  final Exercise exercise;
  final DateTime? date;
  const AddExercise({Key? key, required this.exercise, this.date})
      : super(key: key);

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  late bool isSelected;

  checkIfSelected() async {
    ScheduleExercise? schExercise = await getSchExerciseByDateExerID(
        widget.exercise.id, widget.date ?? DateTime.now());
    isSelected = schExercise != null ? true : false;
    return Future.value(isSelected);
  }

  @override
  void initState() {
    // if (widget.date != null && widget.date.runtimeType == DateTime)
    checkIfSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Exercise exercise = widget.exercise;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(exercise.imgSrc.toString()),
        ),
        title: Text(exercise.name.toString()),
        trailing: FutureBuilder(
            future: checkIfSelected(),
            builder:
                (BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Icon(CupertinoIcons.check_mark_circled_solid);
              } else if (snapshot.hasError) {
                return const Icon(CupertinoIcons.check_mark_circled_solid);
              }
              return isSelected
                  ? const Icon(CupertinoIcons.check_mark_circled_solid)
                  : FloatingActionButton(
                      mini: true,
                      elevation: 0.8,
                      heroTag: Text(exercise.id.toString()),
                      onPressed: () {
                        setState(() {
                          isSelected = true;
                        });

                        if (widget.date != null &&
                            widget.date.runtimeType == DateTime &&
                            exercise.id != null) {
                          addSchExercise({
                            ScheduleExerciseFields.date: DateTime(
                                    widget.date!.year,
                                    widget.date!.month,
                                    widget.date!.day)
                                .microsecondsSinceEpoch,
                            ScheduleExerciseFields.exerciseId:
                                widget.exercise.id,
                            ScheduleExerciseFields.done: 0
                          });
                        }
                      },
                      child: const Icon(CupertinoIcons.add_circled_solid
                          // color: Color.fromARGB(255, 51, 49, 49),
                          ),
                      tooltip: "Add Exercise",
                    );
            }),
      ),
    );
  }
}
