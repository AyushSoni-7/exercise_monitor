import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/pages/exercise/sets.dart';
import 'package:flutter/material.dart';


class ExerciseWidget extends StatefulWidget {
  final Exercise exercise;
  const ExerciseWidget({Key? key, required this.exercise})
      : super(key: key);

  @override
  State<ExerciseWidget> createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  int defaultSet = 0;
  late int nset;

  @override
  void initState() {
    super.initState();
    nset = defaultSet;
  }

  void getSets(int value) {
    setState(() {
      nset = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;
    return Hero(
      tag: exercise.id.toString(),
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 8.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  // color: Colors.blue,
                  child: Text(exercise.name.toString(),
                      style: Theme.of(context).textTheme.headline4),
                ),
                Image.asset(
                  exercise.imgSrc.toString(),
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // const SizedBox(
                      //   height: 40,
                      // ),
                      SetsWidget(
                        returnSet: getSets,
                        defaultSet: defaultSet,
                      ),
                      Text(nset.toString())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
