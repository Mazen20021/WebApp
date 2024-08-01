// ignore: file_names
import 'package:flutter/material.dart';

class CustomColors extends StatelessWidget {
  final List<Color> colors;
  final Alignment start;
  final Alignment end;
  const CustomColors(
      {required this.colors,
      required this.start,
      required this.end,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors, begin: start, end: end)));
  }
}
