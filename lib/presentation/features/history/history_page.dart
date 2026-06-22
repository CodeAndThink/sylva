import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_community/isar.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/time_group.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/history/history_cubit.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/features/history/widgets/history_list_item.dart';
import 'package:sylva/presentation/features/history/widgets/history_grid_item.dart';
import 'package:sylva/presentation/features/history/widgets/history_shimmer_list.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit(
        navigator: HistoryNavigator(context),
        isarService: locator<Isar>(),
      ),
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
      title: S.of(context).history,
      actions: [_buildChangeViewButton()],
      body: _buildBody(),
    );
  }

  Widget _buildChangeViewButton() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
          previous.isGridView != current.isGridView,
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.isGridView ? Icons.grid_view_rounded : Icons.list_outlined,
          ),
          onPressed: () {
            _cubit.toggleView();
          },
        );
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.groupedItems != current.groupedItems ||
          previous.isGridView != current.isGridView,
      builder: (context, state) {
        if (state.status.isLoading) {
          return const HistoryShimmerList();
        }
        if (state.records.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppAssetImage(
                  path: AppAssets.icColors,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                ),
                12.height,
                Text(
                  S.of(context).noHistoryYet,
                  style: _theme.textTheme.titleMedium?.copyWith(
                    color: _theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: state.isGridView
                  ? CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: MediaQuery.of(context).padding.top + 12,
                          ),
                        ),
                        SliverPadding(
                          padding: 12.paddingHorizontal,
                          sliver: SliverMainAxisGroup(
                            slivers: _buildGridSlivers(state.groupedItems),
                          ),
                        ),
                        SliverToBoxAdapter(child: 12.height),
                      ],
                    )
                  : ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        12,
                        MediaQuery.of(context).padding.top + 12,
                        12,
                        12,
                      ),
                      itemCount: state.groupedItems.length,
                      itemBuilder: (context, index) {
                        final item = state.groupedItems[index];
                        if (item is TimeGroup) {
                          return Padding(
                            padding: 4.paddingTop.copyWith(bottom: 8),
                            child: AppTitleText(title: item.title),
                          );
                        } else if (item is HistoryRecord) {
                          return HistoryListItem(
                            record: item,
                            onDelete: () => _cubit.deleteRecord(id: item.id),
                            onTap: () => _cubit.goToPhotoPreview(record: item),
                            isFavorite: item.isFavorite,
                            onFavoritePressed: () =>
                                _cubit.toggleFavorite(item.id),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
            ),
            _buildBottomActions(),
          ],
        );
      },
    );
  }

  Widget _buildBottomActions() {
    return SafeArea(
      child: Padding(
        padding: 16.paddingBottom,
        child: AppTransparentContainer(
          padding: 8.paddingAll,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: 30.borderRadius,
                    color: _theme.colorScheme.primaryContainer,
                  ),
                  padding: 8.paddingHorizontal,
                  child: Center(
                    child: Text(
                      S.of(context).createTime,
                      style: _theme.textTheme.titleSmall?.copyWith(
                        color: _theme.colorScheme.onPrimaryContainer,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _cubit.toggleSort();
                },
                customBorder: const CircleBorder(),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: BlocBuilder<HistoryCubit, HistoryState>(
                    buildWhen: (p, c) => p.isSortAscending != c.isSortAscending,
                    builder: (context, state) {
                      return Icon(
                        state.isSortAscending
                            ? Icons.expand_less_outlined
                            : Icons.expand_more_outlined,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGridSlivers(List<Object> groupedItems) {
    final slivers = <Widget>[];
    List<HistoryRecord> currentRecords = [];

    void addGridSliver() {
      if (currentRecords.isEmpty) return;
      final records = List<HistoryRecord>.from(currentRecords);
      slivers.add(
        SliverPadding(
          padding: 8.paddingBottom,
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final record = records[index];
              return HistoryGridItem(
                record: record,
                onDelete: () => _cubit.deleteRecord(id: record.id),
                onTap: () => _cubit.goToPhotoPreview(record: record),
                isFavorite: record.isFavorite,
                onFavoritePressed: () => _cubit.toggleFavorite(record.id),
              );
            }, childCount: records.length),
          ),
        ),
      );
      currentRecords.clear();
    }

    for (final item in groupedItems) {
      if (item is TimeGroup) {
        addGridSliver();
        slivers.add(
          SliverPadding(
            padding: 4.paddingTop.copyWith(bottom: 8),
            sliver: SliverToBoxAdapter(child: AppTitleText(title: item.title)),
          ),
        );
      } else if (item is HistoryRecord) {
        currentRecords.add(item);
      }
    }
    addGridSliver();

    return slivers;
  }
}
