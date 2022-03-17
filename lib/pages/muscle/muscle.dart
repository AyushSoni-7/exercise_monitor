import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/muscle.dart';
import 'package:exercise_monitor/pages/muscle/add_exercise.dart';
import 'package:exercise_monitor/services/exercise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MuscleWidget extends StatefulWidget {
  final Muscle muscle;
  final DateTime? date;
  const MuscleWidget({Key? key, required this.muscle, this.date})
      : super(key: key);

  @override
  State<MuscleWidget> createState() => _MuscleWidgetState();
}

class _MuscleWidgetState extends State<MuscleWidget> {
  @override
  Widget build(BuildContext context) {
    List<Exercise> exercises = getMuscleId(widget.muscle.id);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
              child: AddExercise(
                exercise: exercises[index],
                date: widget.date,
              ),
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: ButtonBar(children: [
          ElevatedButton(
            onPressed: () => {},
            child: const Text("Done"),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder())),
          )
        ]),
      ),
    );
  }
}
