import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class ShareCubit extends BaseCubit<ShareState> {
  final ShareNavigator navigator;
  final AppPreferencesRepository _appPrefs =
      locator<AppPreferencesRepository>();

  ShareCubit({required this.navigator}) : super(const ShareState()) {
    _loadDownloadedFonts();
  }

  void _loadDownloadedFonts() {
    final List<String> fonts = _appPrefs.downloadedFonts;
    emit(state.copyWith(downloadedFonts: fonts));
  }

  void toggleSelectedColor({required Color color}) {
    final Set<Color> set = state.selectedColors.toSet();
    if (set.contains(color)) {
      set.remove(color);
    } else {
      set.add(color);
    }
    final selectedShape =
        state.selectedColors.isNotEmpty && state.selectedShape.isNone
        ? PaletteShape.circle
        : state.selectedShape;
    emit(state.copyWith(selectedColors: set, selectedShape: selectedShape));
  }

  void changeTab(ShareFeatureTab tab) {
    if (state.currentTab != tab) {
      emit(state.copyWith(currentTab: tab));
    }
  }

  void selectShape(PaletteShape shape) {
    emit(state.copyWith(selectedShape: shape));
  }

  void selectPosition(PalettePosition position) {
    emit(state.copyWith(selectedPosition: position));
  }

  void selectDirection(PaletteDirection direction) {
    emit(state.copyWith(selectedDirection: direction));
  }

  void changeShapeSize(double size) {
    emit(state.copyWith(shapeSize: size));
  }

  void changeShapeSpacing(double spacing) {
    emit(state.copyWith(shapeSpacing: spacing));
  }

  void changeShapeMargin(double margin) {
    emit(state.copyWith(shapeMargin: margin));
  }

  void changeTextOption(ShareTextOption option) {
    emit(state.copyWith(textOption: option));
  }

  void changeTextPosition(ShareTextPosition position) {
    emit(state.copyWith(textPosition: position));
  }

  void changeTextSize(double size) {
    emit(state.copyWith(textSize: size));
  }

  void toggleTextBold() {
    emit(state.copyWith(isTextBold: !state.isTextBold));
  }

  void toggleTextItalic() {
    emit(state.copyWith(isTextItalic: !state.isTextItalic));
  }

  void toggleTextUnderline() {
    emit(state.copyWith(isTextUnderline: !state.isTextUnderline));
  }

  void changeTextColor(Color? color) {
    emit(state.copyWith(textColor: color, clearTextColor: color == null));
  }

  void changeTextFontFamily(String font) {
    emit(state.copyWith(textFontFamily: font));
  }

  Future<void> downloadAndApplyFont(String font) async {
    final downloading = Set<String>.from(state.downloadingFonts)..add(font);
    emit(state.copyWith(downloadingFonts: downloading));

    try {
      GoogleFonts.getFont(font);
      await GoogleFonts.pendingFonts([GoogleFonts.getFont(font)]);

      final downloaded = List<String>.from(state.downloadedFonts);
      if (!downloaded.contains(font)) {
        downloaded.add(font);
        await _appPrefs.setDownloadedFonts(downloaded);
      }

      final newDownloading = Set<String>.from(state.downloadingFonts)
        ..remove(font);
      emit(
        state.copyWith(
          downloadingFonts: newDownloading,
          downloadedFonts: downloaded,
          textFontFamily: font,
        ),
      );
    } catch (e) {
      final newDownloading = Set<String>.from(state.downloadingFonts)
        ..remove(font);
      emit(state.copyWith(downloadingFonts: newDownloading));
    }
  }
}
