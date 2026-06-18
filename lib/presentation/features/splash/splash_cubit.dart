import 'package:sylva/presentation/features/splash/splash_navigator.dart';
import 'package:sylva/presentation/features/splash/splash_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final SplashNavigator navigator;

  SplashCubit({required this.navigator}) : super(const SplashState());
}
