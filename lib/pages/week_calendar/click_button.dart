import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const ClickButton({Key? key, required this.label, required this.onTap})
      : assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryClr),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
