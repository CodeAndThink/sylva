import 'dart:ui';

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
    emit(state.copyWith(selectedColors: set));
  }

  void changeTab(ShareFeatureTab tab) {
    if (state.currentTab != tab) {
      emit(state.copyWith(currentTab: tab));
    }
  }
}
