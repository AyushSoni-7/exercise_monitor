import 'package:exercise_monitor/metadata/metadata.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Navigator.pushNamedAndRemoveUntil(
                context, Metadata.routePath[index], (r) => false);
          },
        )
    ]));
  }
}
