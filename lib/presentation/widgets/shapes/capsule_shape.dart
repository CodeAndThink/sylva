import 'package:flutter/material.dart';

class CapsuleShape extends StatelessWidget {
  final Color color;
  final double size;

  const CapsuleShape({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 1.5,
      height: size * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}
