import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
part 'locale_state.dart';

@lazySingleton
class LocaleCubit extends BaseCubit<LocaleState> {
  final AppPreferencesRepository _appPrefs;

  LocaleCubit(this._appPrefs) : super(_loadInitialState(_appPrefs));

  static LocaleState _loadInitialState(AppPreferencesRepository prefs) {
    return LocaleState(Locale(prefs.languageCode));
  }

  void changeLanguage({required String languageCode}) {
    _appPrefs.setLanguageCode(languageCode);
    safeEmit(LocaleState(Locale(languageCode)));
  }
}
