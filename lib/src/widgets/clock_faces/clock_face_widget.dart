library clock_face_widget;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:octal_clock/octal_clock.dart';

import 'clock_face_type.dart';

part './clock_data.dart';
part './text_clock_face.dart';

/// A widget factory to create a given Clock Face based on its typedef
abstract class ClockFaceWidget implements StatelessWidget {
  factory ClockFaceWidget({
    @required ClockFaceType type,
    @required int hour,
    @required int minute,
    @required int second,
    Key key,
    int millisecond,
    double heightFactor = 0.5, // How we are going to control the height
    Color color = Colors.black, // Our color config, default to black
  }) {
    // factory constructors aren't allowed to have initializers, so put our asserts here
    assert(hour != null);
    assert(minute != null);
    assert(second != null);
    assert(color != null);
    assert(type != null);
    assert(heightFactor >= 0.0);
    assert(heightFactor <= 1.0);

    final _ClockData clockData = new _ClockData(
      hour: hour,
      minute: minute,
      second: second,
      millisecond: millisecond,
      color: color,
      heightFactor: heightFactor,
    );

    switch (type) {
      case ClockFaceType.text:
      default:
        return new _TextClockFace(
          data: clockData,
        );
    }
  }
}
