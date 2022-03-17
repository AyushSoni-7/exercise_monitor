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
  @override
  void initState() {
    // if (widget.date != null && widget.date.runtimeType == DateTime)
    isSelected =
        getExercise(widget.exercise.id, widget.date ?? DateTime.now()) != null
            ? true
            : false;
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
        trailing: isSelected
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
                      widget.date.runtimeType == DateTime) {
                    ScheduleExercise schExercise = objSchExercise(
                      exercise.id,
                      widget.date ?? DateTime.now(),
                    );
                    addExercise(schExercise);
                  }
                },
                child: const Icon(CupertinoIcons.add_circled_solid
                    // color: Color.fromARGB(255, 51, 49, 49),
                    ),
                tooltip: "Add Exercise",
              ),
      ),
    );
  }
}
