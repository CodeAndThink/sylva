import 'package:flutter/material.dart';

class RoundedSquareShape extends StatelessWidget {
  final Color color;
  final double size;

  const RoundedSquareShape({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size * 0.15),
      ),
    );
  }
}
