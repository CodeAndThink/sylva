import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sylva/core/extensions/num_extensions.dart';

class DiamondShape extends StatelessWidget {
  final Color color;
  final double size;

  const DiamondShape({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 2.paddingAll,
      child: SizedBox(
        width: size * 0.7,
        height: size * 0.7,
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Container(color: color),
        ),
      ),
    );
  }
}
