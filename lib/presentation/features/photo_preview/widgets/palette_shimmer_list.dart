import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/widgets/loadings/app_shimmer.dart';

class PaletteShimmerList extends StatelessWidget {
  const PaletteShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) {
          return 10.width;
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              AppShimmerBox(width: 55, height: 55),
              5.height,
              AppShimmerBox(width: 55, height: 12),
            ],
          );
        },
      ),
    );
  }
}
