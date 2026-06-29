import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class CardShape extends StatelessWidget {
  final Color color;
  final double size;

  const CardShape({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.8,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size * 0.1),
      ),
      padding: 2.paddingAll,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: (size * 0.6),
            color: Theme.of(context).colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
