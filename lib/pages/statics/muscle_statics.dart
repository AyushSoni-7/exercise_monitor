import 'package:exercise_monitor/pages/statics/exercises_statics.dart';
import 'package:exercise_monitor/pages/utility/app_bar.dart';
import 'package:exercise_monitor/pages/utility/drawer_page.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:flutter/material.dart';
import '../../models/muscle.dart';
import '../../services/muscle.dart';

class StaticsMuscleGroup extends StatelessWidget {
  final DateTime? date;

  StaticsMuscleGroup({Key? key, this.date}) : super(key: key);

  late List<Muscle> muscles = [];

  Future<dynamic> getMuscleFromDB() async {
    var response = await getMuscleGroup().then((value) => muscles = value);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      appBar: customAppBar(),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
          future: getMuscleFromDB(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return GridView.count(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              crossAxisCount: 2,
              children: <Widget>[
                for (var muscle in muscles)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExerciseStaticWidget(muscleId: muscle.id)));
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
            );
          }),
    );
  }
}
