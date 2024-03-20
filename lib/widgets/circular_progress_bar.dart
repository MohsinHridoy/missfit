import 'package:flutter/material.dart';


class MyCircularProgressPainter extends CustomPainter {
  final double progress;
  final Gradient gradient;
  final Color backgroundColor; // New property for background color

  MyCircularProgressPainter({
    required this.progress,
    required this.gradient,
    required this.backgroundColor, // Pass the background color
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the background circle with the specified background color
    final backgroundPaint = Paint()
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = backgroundColor;

    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc using the gradient
    final progressPaint = Paint()
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = gradient
          .createShader(Rect.fromCircle(center: center, radius: radius));

    final startAngle = 20 * (3.14159265359 / 180); // Convert degrees to radians
    final sweepAngle =
        progress * 360 * (3.14159265359 / 180); // Convert degrees to radians

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}