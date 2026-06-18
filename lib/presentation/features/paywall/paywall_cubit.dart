import 'package:sylva/presentation/features/paywall/paywall_navigator.dart';
import 'package:sylva/presentation/features/paywall/paywall_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class PaywallCubit extends BaseCubit<PaywallState> {
  final PaywallNavigator navigator;

  PaywallCubit({required this.navigator}) : super(const PaywallState());
}
