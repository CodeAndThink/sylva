import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/history/history_cubit.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/widgets/images/app_file_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit(navigator: HistoryNavigator(context)),
      child: const _HistoryChildPage(),
    );
  }
}

class _HistoryChildPage extends StatefulWidget {
  const _HistoryChildPage();

  @override
  State<_HistoryChildPage> createState() => __HistoryChildPageState();
}

class __HistoryChildPageState extends State<_HistoryChildPage> {
  late final HistoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HistoryCubit>();
    _cubit.loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      showAppBar: true,
      title: S.of(context).history,
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state.status == LoadStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.records.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noHistoryYet,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            );
          }

          return GridView.builder(
            padding: 12.paddingAll,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              final record = state.records[index];
              return Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: 8.borderRadius,
                      child: InkWell(
                        onTap: () => _cubit.navigator.goToPhotoPreview(record),
                        child: AppFileImage(
                          path: record.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(28, 28),
                      ),
                      onPressed: () {
                        _cubit.deleteRecord(record.id);
                      },
                    ),
                  ),
                  if (record.selectedColor != null)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Color(record.selectedColor!),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
