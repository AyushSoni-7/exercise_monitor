import 'package:exercise_monitor/pages/muscle/muscle.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:flutter/material.dart';
import '../../models/muscle.dart';
import '../../services/muscle.dart';

class MuscleGroup extends StatelessWidget {
  final DateTime? date;

  MuscleGroup({Key? key, this.date}) : super(key: key);

  late List<Muscle> muscles = [];
  // getMuscleGroup();
  Future<void> getMuscleFromDB() {
    getMuscleGroup().then((value) => muscles = value);
    return new Future.delayed(
        const Duration(seconds: 5), () => print('waiting'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
          future: getMuscleFromDB(),
          builder: (context, data) {
            return muscles.isNotEmpty
                ? GridView.count(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    crossAxisCount: 2,
                    children: <Widget>[
                      for (var muscle in muscles)
                        InkWell(
                          onTap: () {
                            // to get navigated to specific muscle group
                            // Navigator.pushNamed(context, routeName)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MuscleWidget(
                                        muscle: muscle, date: date)));
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(muscle.imgSrc.toString()),
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                widthFactor: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    muscle.name.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : const Loader();
          }),
    );
  }
}
