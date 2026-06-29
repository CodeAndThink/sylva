import 'package:sylva/presentation/features/template_list/template_list_navigator.dart';
import 'package:sylva/presentation/features/template_list/template_list_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class TemplateListCubit extends BaseCubit<TemplateListState> {
  final TemplateListNavigator navigator;
  TemplateListCubit({required this.navigator})
    : super(const TemplateListState());
}
