import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/history/history_cubit.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/features/history/widgets/history_list_item.dart';
import 'package:sylva/presentation/features/history/widgets/history_shimmer_list.dart';
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
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HistoryCubit>();
    _cubit.loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return AppScaffold(
      showAppBar: true,
      title: S.of(context).history,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const HistoryShimmerList();
        }
        if (state.records.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noHistoryYet,
              style: _theme.textTheme.titleMedium?.copyWith(
                color: _theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.fromLTRB(
            12,
            MediaQuery.of(context).padding.top + 12,
            12,
            12,
          ),
          itemCount: state.records.length,
          itemBuilder: (context, index) {
            final record = state.records[index];
            return HistoryListItem(
              record: record,
              onDelete: () => _cubit.deleteRecord(id: record.id),
              onTap: () => _cubit.goToPhotoPreview(record: record),
            );
          },
          separatorBuilder: (context, index) => 12.height,
        );
      },
    );
  }
}
