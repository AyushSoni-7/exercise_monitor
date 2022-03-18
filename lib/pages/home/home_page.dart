import 'package:exercise_monitor/pages/home/drawer_page.dart';
import 'package:flutter/material.dart';

import '../week_calendar/calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const CalendarWidget();
    return Scaffold(
      appBar: AppBar(title: Text("Gym Monitor")),
      drawer: const DrawerMenu(),
      body: const CalendarWidget(),
    );
  }
}
