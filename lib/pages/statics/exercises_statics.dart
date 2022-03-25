import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/pages/statics/statics.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/services/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseStaticWidget extends StatelessWidget {
  final int muscleId;
  late List<Exercise> exercises = [];

  ExerciseStaticWidget({Key? key, required this.muscleId}) : super(key: key);

  Future<List<Exercise>> getMuscleList() async {
    var response = getByMuscleId(muscleId).then((value) => exercises = value);
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StaticsHomeWidget(
                                      exerciseID: exercises[index].id)));
                        },
                        child: Card(
                            child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage(exercises[index].imgSrc.toString()),
                          ),
                          title: Text(exercises[index].name.toString()),
                        )),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return const Loader();
          }),
    );
  }
}
