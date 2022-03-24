import 'package:exercise_monitor/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetsWidget extends StatefulWidget {
  final returnSet;
  final int defaultSet;
  const SetsWidget({Key? key, this.returnSet, required this.defaultSet})
      : super(key: key);

  @override
  _SetsWidgetState createState() => _SetsWidgetState();
}

class _SetsWidgetState extends State<SetsWidget> {
  late int nset;

  @override
  void initState() {
    super.initState();
    nset = widget.defaultSet;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Image.asset("asSetsWidget/flutter.png", width: 100),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.15,
          // ),

          Text(
            "Sets",
            style: sub2HeadingStyle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.07,
            width: MediaQuery.of(context).size.width * 0.07,
            child: FloatingActionButton(
              elevation: 0.5,
              heroTag: null,
              mini: true,
              child: const Icon(CupertinoIcons.add, color: Colors.black87),
              backgroundColor: Colors.white,
              onPressed: () {
                widget.returnSet(1);
                setState(() {});
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            widget.defaultSet.toString(),
            style: sub2HeadingStyle,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Visibility(
            visible: widget.defaultSet > 0 ? true : false,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
              width: MediaQuery.of(context).size.width * 0.08,
              child: FloatingActionButton(
                  elevation: 0.5,
                  heroTag: null,
                  mini: true,
                  onPressed: () {
                    widget.returnSet(-1);
                    setState(() {});
                  },
                  child:
                      const Icon(CupertinoIcons.minus, color: Colors.black87),
                  backgroundColor: Colors.white),
            ),
          ),
          Visibility(
              visible: nset > 0 ? false : true,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.08,
              ))
        ],
      ),
    );
  }
}
