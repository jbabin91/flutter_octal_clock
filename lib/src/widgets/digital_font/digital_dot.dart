part of digital_font;

class DigitalDot extends StatelessWidget {
  final double height;
  final Color color;

  DigitalDot({
    Key key,
    @required this.height,
    @required this.color,
  })  : assert(height != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      size: new Size(height / 2.0, height),
      painter: new _DigitalDotPainter(height, color),
    );
  }
}

class _DigitalDotPainter extends CustomPainter {
  final double height;
  final Color color;

  _DigitalDotPainter(this.height, this.color);

  @override
  bool shouldRepaint(_DigitalDotPainter oldDelegate) {
    return height != oldDelegate.height || color != oldDelegate.color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double width = height / 2;
    final double thickness = width / 3;

    final Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        new Rect.fromLTWH(width / 2 - thickness / 2, height - thickness,
            thickness, thickness),
        paint);
  }
}
