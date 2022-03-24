import 'package:exercise_monitor/models/calendarReport.dart';
import 'package:exercise_monitor/pages/utility/app_bar.dart';
import 'package:exercise_monitor/pages/utility/drawer_page.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/services/addExercise.dart';
import 'package:exercise_monitor/services/calendarReport.dart';
import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarReportWidget extends StatefulWidget {
  const CalendarReportWidget({Key? key}) : super(key: key);

  @override
  _CalendarReportWidgetState createState() => _CalendarReportWidgetState();
}

class _CalendarReportWidgetState extends State<CalendarReportWidget> {
  late DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay = DateTime.now();
  late CalendarFormat _format = CalendarFormat.month;
  List<CalendarExerciseReport>? calExerciseReport;
  List<CalendarReport>? calReport;

  getCalExerciseReport(DateTime date) async {
    return await getExercisesReport(date)
        .then((value) => calExerciseReport = value);
  }

  getCalReport(DateTime date) async {
    return await getCalendarReport(date).then((value) => calReport = value);
  }

  @override
  void initState() {
    getCalReport(DateTime.now());
    getCalExerciseReport(DateTime.now());
    super.initState();
    // setCalendarReport(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          FutureBuilder(
              future: getCalReport(_focusedDay),
              builder:
                  (BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    firstDay: DateTime(1990),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    daysOfWeekVisible: true,
                    calendarFormat: _format,
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        for (CalendarReport calReport in calReport!) {
                          if (day.day == calReport.date.day &&
                              day.month == calReport.date.month &&
                              day.year == calReport.date.year) {
                            return Column(children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${day.day}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              if (calReport.percentageDone > 85)
                                const Icon(Icons.sentiment_satisfied_outlined,
                                    color: Colors.green)
                              else if (calReport.percentageDone >= 40)
                                const Icon(Icons.sentiment_neutral_outlined,
                                    color: Colors.yellow)
                              else
                                const Icon(
                                    Icons.sentiment_dissatisfied_outlined,
                                    color: Colors.red)
                            ]);
                          }
                        }
                        return null;
                      },
                    ),
                    calendarStyle: const CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle)),
                    onDaySelected: (selectedDay, focusedDate) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDate;
                        getCalExerciseReport(focusedDate);
                        // calExerciseReport =  getExercisesReport(focusedDate);
                      });
                    },
                    onFormatChanged: (CalendarFormat format) {
                      setState(() {
                        _format = format;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        getCalReport(_focusedDay);
                        // setCalendarReport(_focusedDay);
                      });
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }
                return const Loader();
              }),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: getCalExerciseReport(_focusedDay),
              builder:
                  (BuildContext buildContext, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4514,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Color(0xff30384c)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            DateFormat("MMMM dd, yyyy").format(_selectedDay),
                            style: headingStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (calExerciseReport != null)
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: calExerciseReport!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: ListTile(
                                    leading: calExerciseReport![index]
                                            .schExercise
                                            .done
                                        ? const Icon(
                                            CupertinoIcons
                                                .check_mark_circled_solid,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            CupertinoIcons.clear_circled_solid,
                                            color: Colors.red,
                                          ),
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(
                                              calExerciseReport![index]
                                                  .exercise
                                                  .imgSrc
                                                  .toString()),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            calExerciseReport![index]
                                                .exercise
                                                .name
                                                .toString(),
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          else
                            const Center(
                                child: Text(
                              "No Data Found",
                            )),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Error");
                }
                return const Loader();
              })
        ],
      ),
    );
  }
}
