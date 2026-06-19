import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/features/home/home_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeNavigator navigator;

  HomeCubit({required this.navigator}) : super(const HomeState());
}
