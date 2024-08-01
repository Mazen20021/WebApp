import 'package:flutter/material.dart';

class NotchedRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double notchWidth = 100.0; // Width of the notch
    double notchHeight = 50.0; // Height of the notch

    path.moveTo(0, 0);
    path.lineTo(size.width - notchWidth, 0);
    path.lineTo(size.width, size.height / 2 - notchHeight / 2);
    path.lineTo(size.width - notchWidth, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
