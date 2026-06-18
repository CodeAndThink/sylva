import 'package:sylva/presentation/features/settings/settings_navigator.dart';
import 'package:sylva/presentation/features/settings/settings_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class SettingsCubit extends BaseCubit<SettingsState> {
  final SettingsNavigator navigator;

  SettingsCubit({required this.navigator}) : super(const SettingsState());
}
