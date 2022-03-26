import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:exercise_monitor/pages/muscle/muscle_group.dart';
import 'package:exercise_monitor/pages/utility/app_bar.dart';
import 'package:exercise_monitor/pages/utility/drawer_page.dart';
import 'package:exercise_monitor/pages/utility/loader.dart';
import 'package:exercise_monitor/pages/week_calendar/click_button.dart';
import 'package:exercise_monitor/pages/week_calendar/to_do_exercise_list.dart';
import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/schedule.dart';
import '../../services/addExercise.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late List<ScheduleExercise> todoExercise;
  @override
  void initState() {
    getToDoExercise(DateTime.now());
    //refresh the page here
    super.initState();
  }

  var isDialOpen = ValueNotifier(false);

  getToDoExercise(DateTime date) async {
    return await getSchExerciseByDate(date)
        .then((value) => todoExercise = value);
  }

  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(),
        drawer: const DrawerMenu(),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _addExerciseBar(),
            _addDatebar(),
            FutureBuilder(
                future: getToDoExercise(_selectedDate),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: todoExercise.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                            child: ToDoExerciseListWidget(
                                schId: todoExercise[index]),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  return const Loader();
                }),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          overlayOpacity: 0.3,
          spacing: 14,
          spaceBetweenChildren: 14,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.sports_gymnastics),
                label: 'Exercise',
                onTap: () {}),
            SpeedDialChild(
                child: const Icon(Icons.sports_martial_arts),
                label: 'Muscle',
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Container _addDatebar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        daysCount: 7,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            getToDoExercise(_selectedDate);
          });
        },
      ),
    );
  }

  Container _addExerciseBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
          ClickButton(
              label: "+ Exercise",
              onTap: () async => {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MuscleGroup(
                                  date: _selectedDate,
                                ))),
                    setState(() {
                      getToDoExercise(_selectedDate);
                    })
                  }),
        ],
      ),
    );
  }
}
