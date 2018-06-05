part of clock_face_widget;

/// The data that will be passed to our ClockFaces
class _ClockData {
  final int hour;
  final int minute;
  final int second;
  final int millisecond;
  final Color color;
  final double heightFactor;

  const _ClockData({
    this.hour,
    this.minute,
    this.second,
    this.millisecond,
    this.color,
    this.heightFactor,
  });
}
