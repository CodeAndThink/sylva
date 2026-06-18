import 'package:sylva/presentation/features/onbroard/onboard_navigator.dart';
import 'package:sylva/presentation/features/onbroard/onboard_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class OnBoardCubit extends BaseCubit<OnboardState> {
  final OnBoardNavigator navigator;

  OnBoardCubit({required this.navigator}) : super(const OnboardState());

  void navigateToHome() {
    navigator.navigateToHome();
  }
}
