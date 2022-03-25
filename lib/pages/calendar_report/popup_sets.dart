import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/material.dart';

class SetCard extends StatelessWidget {
  final int scheduleID;
  late Sets set;
  SetCard({Key? key, required this.scheduleID}) : super(key: key);

  getSetByID() async {
    return await getSetBySchId(scheduleID).then((value) => set = value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSetByID(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
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
                            Center(
                              child: Text(
                                "Number of Sets " + set.nSet.toString(),
                                style: sub2HeadingStyle,
                              ),
                            ),
                            for (int i = 0; i < set.reps.length; i++)
                              Row(
                                children: [
                                  Text(set.reps[i].weight.toString()),
                                  const Text("X"),
                                  Text(set.reps[i].rep.toString())
                                ],
                              ),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          }
          return const Loader();
        });
  }
}
