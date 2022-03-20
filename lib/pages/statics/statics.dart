import 'package:exercise_monitor/models/statics.dart';
import 'package:exercise_monitor/services/statics.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StaticsHomeWidget extends StatefulWidget {
  const StaticsHomeWidget({Key? key}) : super(key: key);

  @override
  _StaticsHomeWidgetState createState() => _StaticsHomeWidgetState();
}

class _StaticsHomeWidgetState extends State<StaticsHomeWidget> {
  int maxSets = 0;

  @override
  void initState() {
    super.initState();
    maxSets = getMaxsets();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.months, interval: 0.5),
      title: ChartTitle(text: 'Reps x Sets Progress'),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<IndexData, DateTime>>[
        for (var set = 0; set < maxSets; set++)
          StackedLineSeries<IndexData, DateTime>(
            name: "Set" + (set + 1).toString(),
            dataSource: getDataIndex(set),
            sortingOrder: SortingOrder.ascending,
            markerSettings: const MarkerSettings(isVisible: true),
            xValueMapper: (IndexData series, _) => series.date,
            yValueMapper: (IndexData series, _) => series.setXreps,
          ),
      ],
    );
  }
}
