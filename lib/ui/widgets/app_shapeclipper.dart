import 'package:flutter/material.dart';

class IrregularShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius =
        size.height * 0.4; // Adjust the radius to control the circular shape
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius));
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.3, 0);
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
