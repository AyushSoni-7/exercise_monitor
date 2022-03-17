import 'package:flutter/material.dart';

class StaticsHomeWidget extends StatefulWidget {
  const StaticsHomeWidget({Key? key}) : super(key: key);

  @override
  _StaticsHomeWidgetState createState() => _StaticsHomeWidgetState();
}

class _StaticsHomeWidgetState extends State<StaticsHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is statis where graph will be show");
  }
}
