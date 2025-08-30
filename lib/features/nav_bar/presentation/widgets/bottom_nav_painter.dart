import 'package:flutter/material.dart';

class BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Create shadow paint
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

    final Path path = Path();
    final Path shadowPath = Path();

    final double sideHeight = 70; // Height of left and right ends

    // Start from bottom left
    path.moveTo(0, size.height);
    shadowPath.moveTo(0, size.height + 3);

    // Left edge - straight up to side height
    path.lineTo(0, size.height - sideHeight);
    shadowPath.lineTo(0, size.height - sideHeight + 3);

    path.lineTo(size.width * 0.30, 0);
    shadowPath.lineTo(size.width * 0.30, 3);

    // Left side of notch - curve down
    path.arcToPoint(Offset(size.width * 0.4, 30), radius: const Radius.circular(35));
    shadowPath.arcToPoint(Offset(size.width * 0.4, 33), radius: const Radius.circular(40));

    // Notch curves
    path.quadraticBezierTo(size.width * 0.42, 55, size.width * 0.50, 55);
    shadowPath.quadraticBezierTo(size.width * 0.42, 58, size.width * 0.50, 58);

    path.quadraticBezierTo(size.width * 0.58, 55, size.width * 0.60, 30);
    shadowPath.quadraticBezierTo(size.width * 0.58, 58, size.width * 0.60, 33);
    // End Notch curves

    // Left side of notch - curve down
    path.arcToPoint(Offset(size.width * 0.7, 0), radius: const Radius.circular(40));
    shadowPath.arcToPoint(Offset(size.width * 0.7, 3), radius: const Radius.circular(40));

    path.lineTo(size.width, size.height - sideHeight);
    shadowPath.lineTo(size.width, size.height - sideHeight);

    path.lineTo(size.width, size.height);
    shadowPath.lineTo(size.width, size.height + 3);

    // Bottom edge
    path.lineTo(0, size.height);
    shadowPath.lineTo(0, size.height + 3);

    path.close();
    shadowPath.close();

    // Draw shadow first
    canvas.drawPath(shadowPath, shadowPaint);
    // Then draw the main shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
