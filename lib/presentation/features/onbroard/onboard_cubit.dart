import 'package:get_it/get_it.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/features/onbroard/onboard_navigator.dart';
import 'package:sylva/presentation/features/onbroard/onboard_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class OnBoardCubit extends BaseCubit<OnboardState> {
  final OnBoardNavigator navigator;

  OnBoardCubit({required this.navigator}) : super(const OnboardState());

  Future<void> navigateToHome() async {
    await GetIt.I<AppCubit>().completeOnboarding();
    navigator.navigateToHome();
  }
}
