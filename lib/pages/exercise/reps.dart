import 'package:exercise_monitor/models/sets.dart';
import 'package:exercise_monitor/services/sets.dart';
import 'package:flutter/material.dart';

class RepsWidget extends StatefulWidget {
  int scheduleId;
  int index;

  RepsWidget({Key? key, required this.scheduleId, required this.index})
      : super(key: key);

  @override
  _RepsWidgetState createState() => _RepsWidgetState();
}

class _RepsWidgetState extends State<RepsWidget> {
  late TextEditingController _weight;
  late TextEditingController _reps;

  @override
  void initState() {
    super.initState();

    Reps rep = getRep(widget.scheduleId, widget.index);
    _weight = TextEditingController(text: rep.weight.toString());
    _reps = TextEditingController(text: rep.rep.toString());
  }

  void update() {
    updateReps(widget.scheduleId, widget.index,
        double.tryParse(_weight.text) ?? 0.0, int.tryParse(_reps.text) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.width * 0.1,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          Flexible(
            child: TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              controller: _weight,
              onChanged: (value) => {
                setState(
                  () => {},
                ),
                update()
                // widget.weights = double.parse(value)
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'weights',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 13),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("X"),
          ),
          Flexible(
            child: TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              controller: _reps,
              onChanged: (value) => {
                update(),
                setState(
                  () => {},
                ),
                // widget.weights = double.parse(value)
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'reps',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 13),
                floatingLabelAlignment: FloatingLabelAlignment.center,
              ),
              keyboardType: TextInputType.number,
            ),
          )
        ],
      ),
    );
  }
}
