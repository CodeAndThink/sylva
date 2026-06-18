import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final ValueNotifier<bool> showNotifier;

  const AppScrollToTopButton({
    super.key,
    required this.scrollController,
    required this.showNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showNotifier,
      builder: (context, show, child) {
        return show
            ? FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                onPressed: () {
                  scrollController.animateTo(
                    0,
                    duration: 300.milliseconds,
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(Icons.expand_less_rounded, size: 32),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
