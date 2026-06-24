import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/core/constants/key_constants.dart';
import 'package:sylva/presentation/app/interaction_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

@lazySingleton
class InteractionCubit extends BaseCubit<InteractionState> {
  final SharedPreferences _prefs;

  InteractionCubit(this._prefs) : super(_loadInitialState(_prefs));

  static InteractionState _loadInitialState(SharedPreferences prefs) {
    final hapticEnabled = prefs.getBool(KeyConstants.hapticEnabled) ?? true;
    final soundEnabled = prefs.getBool(KeyConstants.soundEnabled) ?? true;

    return InteractionState(
      hapticEnabled: hapticEnabled,
      soundEnabled: soundEnabled,
    );
  }

  void toggleHaptic() {
    final newValue = !state.hapticEnabled;
    _prefs.setBool(KeyConstants.hapticEnabled, newValue);
    safeEmit(state.copyWith(hapticEnabled: newValue));
  }

  void toggleSound() {
    final newValue = !state.soundEnabled;
    _prefs.setBool(KeyConstants.soundEnabled, newValue);
    safeEmit(state.copyWith(soundEnabled: newValue));
  }
}
