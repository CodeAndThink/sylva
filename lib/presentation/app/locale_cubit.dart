import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
part 'locale_state.dart';

@lazySingleton
class LocaleCubit extends BaseCubit<LocaleState> {
  final SharedPreferences _prefs;

  LocaleCubit(this._prefs) : super(_loadInitialState(_prefs));

  static LocaleState _loadInitialState(SharedPreferences prefs) {
    final languageCode = prefs.getString('language_code') ?? 'en';
    return LocaleState(Locale(languageCode));
  }

  void changeLanguage({required String languageCode}) {
    _prefs.setString('language_code', languageCode);
    safeEmit(LocaleState(Locale(languageCode)));
  }
}
