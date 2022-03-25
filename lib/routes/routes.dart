import 'package:exercise_monitor/pages/calendar_report/calendar_report.dart';
import 'package:exercise_monitor/pages/statics/muscle_statics.dart';
import 'package:exercise_monitor/pages/week_calendar/calendar.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  "/": (context) => const CalendarWidget(),
  "/report": (context) => const CalendarReportWidget(),
  "/statics": (context) => StaticsMuscleGroup(),
};
