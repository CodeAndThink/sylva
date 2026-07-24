import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class ShareCubit extends BaseCubit<ShareState> {
  final ShareNavigator navigator;
  final AppPreferencesRepository appPrefs;

  static const int _maxHistorySize = 50;

  final List<ShareState> _undoStack = [];
  final List<ShareState> _redoStack = [];

  /// Holds the state snapshot taken when a slider drag begins.
  ShareState? _sliderStartState;

  ShareCubit({required this.navigator, required this.appPrefs})
    : super(const ShareState()) {
    _loadDownloadedFonts();
  }

  bool get canUndo => _undoStack.isNotEmpty;
  bool get canRedo => _redoStack.isNotEmpty;

  // ---------------------------------------------------------------------------
  // History helpers
  // ---------------------------------------------------------------------------

  /// Pushes current state onto the undo stack, clears redo, then emits [newState].
  /// Used for discrete (non-slider) changes.
  void _emitWithHistory({required ShareState newState}) {
    if (_undoStack.length >= _maxHistorySize) {
      _undoStack.removeAt(0);
    }
    _undoStack.add(state);
    _redoStack.clear();
    safeEmit(newState);
  }

  /// Call from the UI's `onChangeStart` to snapshot state before a slider drag.
  void beginSliderChange() {
    _sliderStartState = state;
  }

  /// Call from the UI's `onChangeEnd` to commit the slider drag as a single
  /// undo entry. The snapshot captured in [beginSliderChange] is pushed onto
  /// the undo stack.
  void commitSliderChange() {
    if (_sliderStartState != null) {
      if (_undoStack.length >= _maxHistorySize) {
        _undoStack.removeAt(0);
      }
      _undoStack.add(_sliderStartState!);
      _redoStack.clear();
      _sliderStartState = null;
    }
  }

  void undo() {
    if (!canUndo) return;
    final previous = _undoStack.removeLast();
    _redoStack.add(state);
    // Preserve transient / non-undoable properties
    safeEmit(
      previous.copyWith(
        currentTab: state.currentTab,
        downloadedFonts: state.downloadedFonts,
        downloadingFonts: state.downloadingFonts,
      ),
    );
  }

  void redo() {
    if (!canRedo) return;
    final next = _redoStack.removeLast();
    _undoStack.add(state);
    // Preserve transient / non-undoable properties
    safeEmit(
      next.copyWith(
        currentTab: state.currentTab,
        downloadedFonts: state.downloadedFonts,
        downloadingFonts: state.downloadingFonts,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Non-undoable actions (tab, font loading)
  // ---------------------------------------------------------------------------

  void _loadDownloadedFonts() {
    final List<String> fonts = appPrefs.downloadedFonts;
    safeEmit(state.copyWith(downloadedFonts: fonts));
  }

  void changeTab({required ShareFeatureTab tab}) {
    if (state.currentTab != tab) {
      safeEmit(state.copyWith(currentTab: tab));
    }
  }

  // ---------------------------------------------------------------------------
  // Discrete edit actions (undoable)
  // ---------------------------------------------------------------------------

  void toggleSelectedColor({required Color color}) {
    final Set<Color> set = state.selectedColors.toSet();
    if (set.contains(color)) {
      set.remove(color);
    } else {
      set.add(color);
    }
    final selectedShape = set.isEmpty
        ? PaletteShape.none
        : (state.selectedShape.isNone
              ? PaletteShape.circle
              : state.selectedShape);
    _emitWithHistory(
      newState: state.copyWith(
        selectedColors: set,
        selectedShape: selectedShape,
      ),
    );
  }

  void selectShape({required PaletteShape shape}) {
    _emitWithHistory(newState: state.copyWith(selectedShape: shape));
  }

  void selectPosition({required PalettePosition position}) {
    _emitWithHistory(newState: state.copyWith(selectedPosition: position));
  }

  void selectDirection({required PaletteDirection direction}) {
    _emitWithHistory(newState: state.copyWith(selectedDirection: direction));
  }

  void changeTextOption({required ShareTextOption option}) {
    _emitWithHistory(newState: state.copyWith(textOption: option));
  }

  void changeTextPosition({required ShareTextPosition position}) {
    _emitWithHistory(newState: state.copyWith(textPosition: position));
  }

  void toggleTextBold() {
    _emitWithHistory(newState: state.copyWith(isTextBold: !state.isTextBold));
  }

  void toggleTextItalic() {
    _emitWithHistory(
      newState: state.copyWith(isTextItalic: !state.isTextItalic),
    );
  }

  void toggleTextUnderline() {
    _emitWithHistory(
      newState: state.copyWith(isTextUnderline: !state.isTextUnderline),
    );
  }

  void changeTextColor({Color? color}) {
    _emitWithHistory(
      newState: state.copyWith(textColor: color, clearTextColor: color == null),
    );
  }

  void changeTextFontFamily({required String font}) {
    _emitWithHistory(newState: state.copyWith(textFontFamily: font));
  }

  // ---------------------------------------------------------------------------
  // Slider-bound actions (live preview only, no history per tick)
  // ---------------------------------------------------------------------------

  void changeShapeSize({required double size}) {
    safeEmit(state.copyWith(shapeSize: size));
  }

  void changeShapeSpacing({required double spacing}) {
    safeEmit(state.copyWith(shapeSpacing: spacing));
  }

  void changeShapeMargin({required double margin}) {
    safeEmit(state.copyWith(shapeMargin: margin));
  }

  void changeTextSize({required double size}) {
    safeEmit(state.copyWith(textSize: size));
  }

  // ---------------------------------------------------------------------------
  // Font download (mixed: downloading state is non-undoable, font apply is)
  // ---------------------------------------------------------------------------

  Future<void> downloadAndApplyFont({required String font}) async {
    final downloading = Set<String>.from(state.downloadingFonts)..add(font);
    safeEmit(state.copyWith(downloadingFonts: downloading));

    try {
      GoogleFonts.getFont(font);
      await GoogleFonts.pendingFonts([GoogleFonts.getFont(font)]);

      final downloaded = List<String>.from(state.downloadedFonts);
      if (!downloaded.contains(font)) {
        downloaded.add(font);
        await appPrefs.setDownloadedFonts(downloaded);
      }

      final newDownloading = Set<String>.from(state.downloadingFonts)
        ..remove(font);

      // Apply font is an undoable edit; downloading state update is kept in sync.
      _emitWithHistory(
        newState: state.copyWith(
          downloadingFonts: newDownloading,
          downloadedFonts: downloaded,
          textFontFamily: font,
        ),
      );
    } catch (e) {
      final newDownloading = Set<String>.from(state.downloadingFonts)
        ..remove(font);
      safeEmit(state.copyWith(downloadingFonts: newDownloading));
    }
  }
}
