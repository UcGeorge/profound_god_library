import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomTabIndicator({@required Color color, @required double length})
      : _painter = CustomPainter(color, length);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class CustomPainter extends BoxPainter {
  final Paint _paint;
  final double length;

  CustomPainter(Color color, this.length)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset left = offset + Offset((cfg.size.width - length)/2, cfg.size.height - 1.5);
    final Offset right = offset + Offset(cfg.size.width -((cfg.size.width - length)/2), cfg.size.height - 1.5);
    canvas.drawLine(left, right, _paint);
  }
}