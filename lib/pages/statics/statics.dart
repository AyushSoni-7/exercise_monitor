import 'package:exercise_monitor/models/statics.dart';
import 'package:exercise_monitor/pages/utility/app_bar.dart';
import 'package:exercise_monitor/pages/utility/drawer_page.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/services/statics.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticsHomeWidget extends StatefulWidget {
  const StaticsHomeWidget({Key? key}) : super(key: key);

  @override
  _StaticsHomeWidgetState createState() => _StaticsHomeWidgetState();
}

class _StaticsHomeWidgetState extends State<StaticsHomeWidget> {
  late List<SetRepStat> setRepStatData;

  getsStaticsData(int exerciseID) async {
    return await getsetRepStatData(exerciseID)
        .then((value) => setRepStatData = value);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: getsStaticsData(1),
        builder: (BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                  intervalType: DateTimeIntervalType.months, interval: 0.5),
              title: ChartTitle(text: 'Reps x Sets Progress'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<IndexData, DateTime>>[
                for (var set = 0; set < getMaxsets(setRepStatData); set++)
                  StackedLineSeries<IndexData, DateTime>(
                    name: "Set" + (set + 1).toString(),
                    dataSource: getDataIndex(setRepStatData, set),
                    sortingOrder: SortingOrder.ascending,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: (IndexData series, _) => series.date,
                    yValueMapper: (IndexData series, _) => series.setXreps,
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          }
          return const Loader();
        },
      ),
    );
  }
}
