import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HistoryCubit extends BaseCubit<HistoryState> {
  final HistoryNavigator navigator;
  HistoryCubit({required this.navigator}) : super(const HistoryState());
}
