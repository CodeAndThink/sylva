import 'dart:ui';

import 'package:sylva/core/enums/template_enums.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/features/share/share_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class ShareCubit extends BaseCubit<ShareState> {
  final ShareNavigator navigator;

  ShareCubit({required this.navigator}) : super(const ShareState());

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
}
