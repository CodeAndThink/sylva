import 'package:sylva/presentation/features/about/about_navigator.dart';
import 'package:sylva/presentation/features/about/about_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
import 'package:sylva/core/configs/app_env_configs.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCubit extends BaseCubit<AboutAppState> {
  final AboutNavigator navigator;

  AboutCubit({required this.navigator}) : super(const AboutAppState());

  Future<void> openKofiPage() async {
    final uri = Uri.parse(AppEnvConfigs.koFiLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
