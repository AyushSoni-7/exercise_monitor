import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/muscle.dart';
import 'package:exercise_monitor/pages/muscle/add_exercise.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/services/exercise.dart';
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
  late List<Exercise> exercises = [];

  Future<List<Exercise>> getMuscleList() async {
    // Future<List<Exercise>> response = getByMuscleId(widget.muscle.id as int);
    // .then((List<Exercise> value) => exercises = value);
    // return response;
    var response =
        getByMuscleId(widget.muscle.id).then((value) => exercises = value);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getMuscleList(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                      // child: Text("Hello"),
                      child: AddExercise(
                        exercise: exercises[index],
                        date: widget.date,
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Loader();
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
