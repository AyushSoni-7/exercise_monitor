import 'package:exercise_monitor/pages/calendar_report/calendar_report.dart';
import 'package:exercise_monitor/pages/home/drawer_page.dart';
import 'package:exercise_monitor/pages/statics/statics.dart';
import 'package:flutter/material.dart';

import '../week_calendar/calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const CalendarWidget();
    return Scaffold(
      appBar: AppBar(title: const Text("Gym Monitor")),
      drawer: const DrawerMenu(),
      // body: const CalendarReportWidget(),
      body: const StaticsHomeWidget(),
    );
  }
}
