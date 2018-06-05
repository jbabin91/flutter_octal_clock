import 'dart:async';
import 'package:octal_clock/octal_clock.dart';
import 'package:flutter/material.dart';

import '../widgets/clock_faces/clock_face_type.dart';
import '../widgets/clock_faces/clock_face_widget.dart';

class ClockPage extends StatefulWidget {
  ClockPage({Key key}) : super(key: key);

  @override
  _ClockPageState createState() => new _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  Timer _timer;
  OctalDateTime _time;
  ClockFaceType _type;
  double _heightFactor;
  Color _color;

  @override
  void initState() {
    super.initState();
    _time = new OctalDateTime.now();
    _type = ClockFaceType.text;
    _heightFactor = 0.5;
    _color = null;

    const duration = const Duration(
        milliseconds: OctalDuration.MILLISECONDS_PER_SECOND ~/ 4);

    _timer = new Timer.periodic(duration, _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer _) {
    setState(() {
      _time = new OctalDateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Color color = _color ?? themeData.textTheme.display1.color;

    final String date = '${_time.year}-${_time.month}-${_time.day}';

    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.watch_later),
        title: new Text('Octal Clock'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text(
                date,
                style: themeData.textTheme.headline,
              ),
            ),
            new Expanded(
              flex: 2,
              child: new ClockFaceWidget(
                type: _type,
                heightFactor: _heightFactor,
                hour: _time.hour,
                minute: _time.minute,
                second: _time.second,
                millisecond: _time.millisecond,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
