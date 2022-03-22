import 'package:exercise_monitor/models/exercise.dart';
import 'package:exercise_monitor/models/schedule.dart';
import 'package:exercise_monitor/services/exercise.dart';
import 'package:flutter/material.dart';

class CardTitleWeekCalendar extends StatelessWidget {
  final ScheduleExercise schId;
  CardTitleWeekCalendar({Key? key, required this.schId}) : super(key: key);
  late Exercise? exercise;

  getExercise() {
    return getExerciseById(schId.exerciseId).then((value) => exercise = value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getExercise(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(exercise!.imgSrc.toString()),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(exercise!.name.toString(), overflow: TextOverflow.ellipsis),
            ],
          );
        });
  }
}
