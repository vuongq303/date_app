import 'dart:math';

import 'package:flutter/material.dart';

class DrawCycle extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double end;

  const DrawCycle({
    required this.strokeWidth,
    required this.color,
    required this.end,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromPoints(
      const Offset(0, 0),
      Offset(size.height, size.width),
    );

    canvas.drawArc(rect, 3 * pi / 2, end, false, paint);
  }

  @override
  bool shouldRepaint(covariant DrawCycle oldDelegate) {
    return oldDelegate.end != end;
  }
}
