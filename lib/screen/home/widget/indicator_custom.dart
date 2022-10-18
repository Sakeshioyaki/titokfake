import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({
    required Color color,
    required double radius,
    required double width,
    required double weight,
  }) : _painter = _CirclePainter(color, radius, weight, width);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius, double weight, double width)
      : _paint = Paint()
          ..color = color
          ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(1 + cfg.size!.width / 3, cfg.size!.height - 5);
    Offset startingPoint =
        Offset(1 + cfg.size!.width / 3, cfg.size!.height - 5);
    Offset endingPoint = Offset(cfg.size!.width * 2 / 3, cfg.size!.height - 5);
    canvas.drawCircle(circleOffset, 1, _paint);

    canvas.drawLine(offset + startingPoint, offset + endingPoint, _paint);
    final endLine = endingPoint + offset;
    canvas.drawCircle(endLine, 1, _paint);
  }
}
