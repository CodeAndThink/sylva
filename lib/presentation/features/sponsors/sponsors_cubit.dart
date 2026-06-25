import 'package:sylva/presentation/features/sponsors/sponsors_navigator.dart';
import 'package:sylva/presentation/features/sponsors/sponsors_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
import 'package:sylva/core/configs/app_env_configs.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsorsCubit extends BaseCubit<SponsorsState> {
  final SponsorsNavigator navigator;

  SponsorsCubit({required this.navigator}) : super(const SponsorsState());

  Future<void> openKofiPage() async {
    final uri = Uri.parse(AppEnvConfigs.koFiLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
