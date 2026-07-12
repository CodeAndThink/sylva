import 'package:injectable/injectable.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/presentation/app/interaction_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

@lazySingleton
class InteractionCubit extends BaseCubit<InteractionState> {
  final AppPreferencesRepository _appPrefs;

  InteractionCubit(this._appPrefs) : super(_loadInitialState(_appPrefs));

  static InteractionState _loadInitialState(AppPreferencesRepository prefs) {
    return InteractionState(
      hapticEnabled: prefs.isHapticEnabled,
      soundEnabled: prefs.isSoundEnabled,
    );
  }

  void toggleHaptic() {
    final newValue = !state.hapticEnabled;
    _appPrefs.setHapticEnabled(newValue);
    safeEmit(state.copyWith(hapticEnabled: newValue));
  }

  void toggleSound() {
    final newValue = !state.soundEnabled;
    _appPrefs.setSoundEnabled(newValue);
    safeEmit(state.copyWith(soundEnabled: newValue));
  }
}
