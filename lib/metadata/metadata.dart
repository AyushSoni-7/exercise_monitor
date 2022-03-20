import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Metadata {
  static List<String> drawerMenu = [
    "Home",
    "Statics",
    "Calendar",
    // "Setting",
    // "Logout"
  ];

  static List<IconData> drawerMenuIcons = [
    CupertinoIcons.home,
    CupertinoIcons.graph_square,
    CupertinoIcons.calendar,
    // CupertinoIcons.settings,
    // Icons.logout
  ];

  static List<String> routePath = [
    "/",
    "/statics",
    "/report",
    // "/statics",
    // "/statics"
  ];
}
