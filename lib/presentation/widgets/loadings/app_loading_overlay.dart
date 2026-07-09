import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'app_loading.dart';

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({super.key});

  static OverlayEntry? _currentOverlay;
  static Timer? _showTimer;
  static DateTime? _showTime;

  static void show(
    BuildContext context, {
    Duration delay = const Duration(milliseconds: 150),
    Duration minShowDuration = const Duration(milliseconds: 500),
  }) {
    _showTimer?.cancel();

    if (_currentOverlay != null) return;

    _showTimer = Timer(delay, () {
      if (_currentOverlay != null) return;

      _currentOverlay = OverlayEntry(
        builder: (context) => Positioned.fill(
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(color: Colors.black.withValues(alpha: 0.3)),
              ),
              const Center(child: AppLoading()),
            ],
          ),
        ),
      );

      Overlay.of(context, rootOverlay: true).insert(_currentOverlay!);
      _showTime = DateTime.now();
    });
  }

  static void hide([BuildContext? context]) {
    _showTimer?.cancel();

    if (_currentOverlay == null) return;

    final minShowDuration = 500.milliseconds;
    final elapsed = DateTime.now().difference(_showTime ?? DateTime.now());

    if (elapsed < minShowDuration) {
      Future.delayed(minShowDuration - elapsed, () {
        _removeOverlay();
      });
    } else {
      _removeOverlay();
    }
  }

  static void _removeOverlay() {
    _currentOverlay?.remove();
    _currentOverlay = null;
    _showTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(color: Colors.black.withValues(alpha: 0.3)),
        ),
        const Center(child: AppLoading()),
      ],
    );
  }
}
