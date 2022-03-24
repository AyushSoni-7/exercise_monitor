import 'package:exercise_monitor/models/sets.dart';
import 'package:flutter/material.dart';

class RepsWidget extends StatefulWidget {
  Sets set;
  int index;
  final returnRep;

  RepsWidget({Key? key, required this.set, required this.index, this.returnRep})
      : super(key: key);

  @override
  _RepsWidgetState createState() => _RepsWidgetState();
}

class _RepsWidgetState extends State<RepsWidget> {
  late TextEditingController _weight;
  late TextEditingController _reps;
  late Reps rep;

  @override
  void initState() {
    rep = widget.set.reps.elementAt(widget.index);
    _weight = TextEditingController(text: rep.weight.toString());
    _reps = TextEditingController(text: rep.rep.toString());
    super.initState();
  }

  // ${SetTableFields.weight} $_doubleType
  void update() {
    rep.rep = int.tryParse(_reps.text) ?? 0;
    rep.weight = int.tryParse(_weight.text) ?? 0;
    widget.returnRep(rep, widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.width * 0.1,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Text("Set " + (widget.index + 1).toString()),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
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
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
    );
  }
}
