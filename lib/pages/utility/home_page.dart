import 'package:exercise_monitor/metadata/metadata.dart';
import 'package:exercise_monitor/pages/calendar_report/calendar_report.dart';
// import 'package:exercise_monitor/pages/home/drawer_page.dart';
import 'package:exercise_monitor/pages/statics/statics.dart';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';

import '../week_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // return const CalendarWidget();
    return Scaffold(
        appBar: AppBar(title: const Text("Gym Monitor")),
        drawer: _drawer(),
        // body: const CalendarReportWidget(),
        body: WillPopScope(
          onWillPop: () async {
            if (navigatorKey.currentState!.canPop()) {
              navigatorKey.currentState?.pop();
              return false;
            }
            return true;
          },
          child: Navigator(
              key: navigatorKey,
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/':
                    builder = (BuildContext context) => const CalendarWidget();
                    break;
                  case '/statics':
                    builder =
                        (BuildContext context) => const StaticsHomeWidget();
                    break;
                  case '/report':
                    builder =
                        (BuildContext context) => const CalendarReportWidget();
                    break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(
                  builder: builder,
                  settings: settings,
                );
              }),
        ));
  }

  Drawer _drawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const UserAccountsDrawerHeader(
        accountEmail: Text(
            'ayushsoni47.as@gmail.com'), // keep blank text because email is required
        accountName: Text('Ayush'),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("AS"),
        ),
      ),
      for (int index = 0; index < Metadata.drawerMenu.length; index++)
        ListTile(
          leading: Icon(Metadata.drawerMenuIcons[index]),
          title: Text(Metadata.drawerMenu[index]),
          onTap: () {
            // Update the state of the app.
            // ...
            navigatorKey.currentState
                ?.popAndPushNamed(Metadata.routePath[index]);
            Navigator.of(context).pop();
          },
        )
    ]));
  }
}
