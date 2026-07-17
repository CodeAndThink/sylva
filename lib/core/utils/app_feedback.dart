import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:sylva/presentation/app/interaction_cubit.dart';

/// Utility class for providing haptic and audio feedback during interactions.
class AppFeedback {
  AppFeedback._();

  /// Plays a light haptic feedback if enabled in the user's settings.
  static void playLight(BuildContext context) {
    final hapticEnabled = context.read<InteractionCubit>().state.hapticEnabled;
    if (hapticEnabled) {
      Haptics.vibrate(HapticsType.light);
    }
  }

  /// Plays a heavy haptic feedback if enabled in the user's settings.
  static void playHeavy(BuildContext context) {
    final hapticEnabled = context.read<InteractionCubit>().state.hapticEnabled;
    if (hapticEnabled) {
      Haptics.vibrate(HapticsType.heavy);
    }
  }

  /// Plays a default system click sound if enabled in the user's settings.
  static void playClickSound(BuildContext context) {
    final soundEnabled = context.read<InteractionCubit>().state.soundEnabled;
    if (soundEnabled) {
      SystemSound.play(SystemSoundType.click);
    }
  }

  /// Plays a standard interaction feedback (light haptic + click sound).
  static void playInteract(BuildContext context) {
    playLight(context);
    playClickSound(context);
  }

  /// Plays a long interaction feedback (heavy haptic + click sound).
  static void playLongInteract(BuildContext context) {
    playHeavy(context);
    playClickSound(context);
  }
}
