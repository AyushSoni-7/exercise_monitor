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
  double percentDone = 0.1;
  List<DateTime> toHighlight = List<DateTime>.generate(
      10,
      (i) => DateTime.utc(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).add(Duration(days: -i)));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get data of the month
    // calculate the percentage exercise done
    // and list of todo exercise for the date
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          startingDayOfWeek: StartingDayOfWeek.sunday,
          firstDay: DateTime(1990),
          lastDay: DateTime.now(),
          focusedDay: _focusedDay,
          daysOfWeekVisible: true,
          calendarFormat: _format,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              for (DateTime d in toHighlight) {
                if (day.day == d.day &&
                    day.month == d.month &&
                    day.year == d.year) {
                  return Container(
                    child: Column(children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${day.day}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      if (percentDone > 0.85)
                        const Icon(Icons.sentiment_satisfied_outlined,
                            color: Colors.green)
                      else if (percentDone >= 0.4)
                        const Icon(Icons.sentiment_neutral_outlined,
                            color: Color.fromARGB(255, 235, 235, 81))
                      else
                        const Icon(Icons.sentiment_dissatisfied_outlined,
                            color: Colors.red)
                    ]),
                  );
                }
              }
              return null;
            },
          ),
          calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
          onDaySelected: (selectedDay, focusedDate) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDate;
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
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height*0.45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color(0xff30384c)),
            child: Text(_focusedDay.toString()),
          ),
        )
      ],
    );
  }
}
