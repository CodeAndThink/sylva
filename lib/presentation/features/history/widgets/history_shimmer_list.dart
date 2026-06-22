import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/widgets/loadings/app_shimmer.dart';

class HistoryShimmerList extends StatelessWidget {
  const HistoryShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          12,
          MediaQuery.of(context).padding.top + 12,
          12,
          12,
        ),
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => 12.height,
        itemBuilder: (context, index) {
          return AppShimmerBox(
            width: double.maxFinite,
            height: 110,
            borderRadius: 20,
          );
        },
      ),
    );
  }
}
