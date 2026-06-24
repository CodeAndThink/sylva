import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:sylva/presentation/app/interaction_cubit.dart';

class AppFeedback {
  AppFeedback._();

  static void playLight(BuildContext context) {
    final hapticEnabled = context.read<InteractionCubit>().state.hapticEnabled;
    if (hapticEnabled) {
      Haptics.vibrate(HapticsType.light);
    }
  }

  static void playHeavy(BuildContext context) {
    final hapticEnabled = context.read<InteractionCubit>().state.hapticEnabled;
    if (hapticEnabled) {
      Haptics.vibrate(HapticsType.heavy);
    }
  }

  static void playClickSound(BuildContext context) {
    final soundEnabled = context.read<InteractionCubit>().state.soundEnabled;
    if (soundEnabled) {
      SystemSound.play(SystemSoundType.click);
    }
  }

  static void playInteract(BuildContext context) {
    playLight(context);
    playClickSound(context);
  }

  static void playLongInteract(BuildContext context) {
    playHeavy(context);
    playClickSound(context);
  }
}
