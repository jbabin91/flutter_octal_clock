part of clock_face_widget;

// 0-padding for hours/minutes/seconds
String twoDigits(int d) {
  if (d < 10) return '0$d';
  return d.toString();
}

// 0-padding for milliseconds
String threeDigits(int d) {
  if (d < 10) return '00$d';
  if (d < 100) return '0$d';
  return d.toString();
}

/// A clock face that displays the time as a normal looking text String
class _TextClockFace extends StatelessWidget implements ClockFaceWidget {
  final _ClockData data;

  // Size from 10.0 to 50.0
  static const MIN_SIZE = 10.0;
  static const SIZE_RANGE = 40.0;

  const _TextClockFace({
    Key key,
    @required this.data,
  })  : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only display milliseconds if they were passed as data
    final String millisecondStr =
        data.millisecond != null ? '.$threeDigits(data.millisecond)' : '';

    // Format our date string
    final String timeStr =
        '$twoDigits(date.hour):$twoDigits(date.minute):$twoDigits(date.second)$millisecondStr';

    final double fontSize = MIN_SIZE + (SIZE_RANGE * data.heightFactor);

    final ThemeData themeData = Theme.of(context);
    final TextStyle textStyle = themeData.textTheme.display1
        .copyWith(color: data.color, fontSize: fontSize);

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          timeStr,
          style: textStyle,
        ),
      ],
    );
  }
}
