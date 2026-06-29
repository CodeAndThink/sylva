import 'package:flutter/material.dart';

class SquareShape extends StatelessWidget {
  final Color color;
  final double size;

  const SquareShape({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(width: size, height: size, color: color);
  }
}
