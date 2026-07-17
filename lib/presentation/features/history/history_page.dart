import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_community/isar.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/time_group.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/history/history_cubit.dart';
import 'package:sylva/presentation/features/history/history_navigator.dart';
import 'package:sylva/presentation/features/history/history_state.dart';
import 'package:sylva/presentation/features/history/widgets/history_list_item.dart';
import 'package:sylva/presentation/features/history/widgets/history_grid_item.dart';
import 'package:sylva/presentation/features/history/widgets/history_shimmer_list.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';
import 'package:sylva/presentation/widgets/loadings/app_loading.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:sylva/presentation/widgets/text/app_title_text.dart';
import 'package:sylva/presentation/widgets/tutorial/app_tutorial_helper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
  late S _l10n;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showScrollToTop = ValueNotifier(false);
  final GlobalKey _keyDeleteAll = GlobalKey();
  final GlobalKey _keyChangeView = GlobalKey();
  final GlobalKey _keyFavoriteOnly = GlobalKey();
  final GlobalKey _keySort = GlobalKey();
  TutorialCoachMark? tutorialCoachMark;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HistoryCubit>();
    _cubit.loadHistory();
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) {
        _showScrollToTop.value = false;
        return;
      }

      final bool shouldShow =
          _scrollController.offset > 200 &&
          _scrollController.position.maxScrollExtent > 0;

      if (_showScrollToTop.value != shouldShow) {
        _showScrollToTop.value = shouldShow;
      }

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.9) {
        _cubit.loadMoreHistory();
      }
    });
  }

  void _handleCleanHistory() {
    _cubit.navigator.dialog.showConfirm(
      title: _l10n.clearAllHistory,
      message: _l10n.clearAllHistoryConfirm,
      leftText: _l10n.cancel,
      rightText: _l10n.delete,
      rightColor: _theme.colorScheme.error,
      onRight: () {
        _cubit.clearHistory();
        _showScrollToTop.value = false;
      },
    );
  }

  void _showTutorial() {
    tutorialCoachMark = AppTutorialHelper.showTutorial(
      context: context,
      targets: _createTargets(),
    );
  }

  List<TargetFocus> _createTargets() {
    return [
      if (_cubit.state.records.isNotEmpty)
        AppTutorialHelper.buildTarget(
          context: context,
          key: _keyDeleteAll,
          title: _l10n.tutorialDeleteAllTitle,
          desc: _l10n.tutorialDeleteAllDesc,
          contentAlign: ContentAlign.bottom,
        ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyChangeView,
        title: _l10n.tutorialHistoryViewTitle,
        desc: _l10n.tutorialHistoryViewDesc,
        contentAlign: ContentAlign.top,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyFavoriteOnly,
        title: _l10n.tutorialFavoritesTitle,
        desc: _l10n.tutorialFavoritesDesc,
        contentAlign: ContentAlign.top,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keySort,
        title: _l10n.tutorialSortTitle,
        desc: _l10n.tutorialSortDesc,
        contentAlign: ContentAlign.top,
      ),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _showScrollToTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    return AppScaffold(
      title: _l10n.history,
      actions: [_buildCleanHistoryAction()],
      body: _buildBody(),
    );
  }

  Widget _buildCleanHistoryAction() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
          previous.records.isNotEmpty != current.records.isNotEmpty,
      builder: (context, state) {
        if (state.records.isEmpty) {
          return const SizedBox.shrink();
        }
        return Tooltip(
          message: _l10n.clearAllHistory,
          child: IconButton(
            key: _keyDeleteAll,
            icon: Icon(
              Icons.auto_delete_rounded,
              color: _theme.colorScheme.error,
            ),
            onPressed: () {
              _handleCleanHistory();
            },
          ),
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
        if (state.status.isInitial) {
          return const HistoryShimmerList();
        }

        return Stack(
          children: [
            if (state.records.isNotEmpty) ...[
              Positioned.fill(
                child: state.isGridView
                    ? CustomScrollView(
                        controller: _scrollController,
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
                          if (state.isLoadingMore)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: 16.paddingAll,
                                child: AppLoading(),
                              ),
                            ),
                          SliverToBoxAdapter(child: 100.height),
                        ],
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.fromLTRB(
                          12,
                          MediaQuery.of(context).padding.top + 12,
                          12,
                          100,
                        ),
                        itemCount:
                            state.groupedItems.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.groupedItems.length) {
                            return Padding(
                              padding: 16.paddingAll,
                              child: AppLoading(),
                            );
                          }

                          final item = state.groupedItems[index];
                          if (item is TimeGroup) {
                            return Padding(
                              padding: 4.paddingTop,
                              child: AppTitleText(title: item.title),
                            );
                          } else if (item is HistoryRecord) {
                            return HistoryListItem(
                              key: ValueKey('list_${item.id}'),
                              record: item,
                              onDelete: () => _cubit.deleteRecord(id: item.id),
                              onTap: () =>
                                  _cubit.goToPhotoPreview(record: item),
                              isFavorite: item.isFavorite,
                              onFavoritePressed: () =>
                                  _cubit.toggleFavorite(item.id),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
              ),
            ] else ...[
              Positioned.fill(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppAssetImage(
                        path: AppAssets.icColors,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                      ),
                      12.height,
                      Text(
                        _l10n.noHistoryYet,
                        style: _theme.textTheme.titleMedium?.copyWith(
                          color: _theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomActions(),
            ),
          ],
        );
      },
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
                key: ValueKey('grid_${record.id}'),
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
            padding: 4.paddingTop,
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

  Widget _buildBottomActions() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: 12.paddingBottom,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTransparentContainer(
              padding: 4.paddingAll,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHelperButton(),
                  _buildChangeViewButton(),
                  _buildFavoriteOnlyButton(),
                  8.width,
                  _buildSortButton(),
                  4.width,
                ],
              ),
            ),
            _buildScrollToTopButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHelperButton() {
    return Tooltip(
      message: _l10n.help,
      child: IconButton(
        icon: Icon(
          Icons.help_outline_outlined,
          color: _theme.colorScheme.onSurface,
          size: 24,
        ),
        onPressed: _showTutorial,
      ),
    );
  }

  Widget _buildChangeViewButton() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
          previous.isGridView != current.isGridView,
      builder: (context, state) {
        return Tooltip(
          message: _l10n.historyView,
          child: IconButton(
            key: _keyChangeView,
            icon: Icon(
              state.isGridView ? Icons.grid_view_rounded : Icons.list_outlined,
            ),
            onPressed: () {
              AppFeedback.playInteract(context);
              if (_scrollController.hasClients) {
                _scrollController.jumpTo(0);
              }
              _cubit.toggleView();
              _showScrollToTop.value = false;
            },
          ),
        );
      },
    );
  }

  Widget _buildFavoriteOnlyButton() {
    return Tooltip(
      message: _l10n.onlyFavorites,
      child: InkWell(
        key: _keyFavoriteOnly,
        onTap: () {
          AppFeedback.playInteract(context);
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(0);
          }
          _cubit.toggleFavoriteOnly();
          _showScrollToTop.value = false;
        },
        customBorder: const CircleBorder(),
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: BlocBuilder<HistoryCubit, HistoryState>(
            buildWhen: (p, c) => p.isFavoriteOnly != c.isFavoriteOnly,
            builder: (context, state) {
              return Icon(
                state.isFavoriteOnly
                    ? Icons.bookmark
                    : Icons.bookmark_outline_rounded,
                color: state.isFavoriteOnly
                    ? Colors.amber
                    : _theme.colorScheme.onSurfaceVariant,
                size: 24,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSortButton() {
    return Tooltip(
      message: _l10n.historySort,
      child: InkWell(
        key: _keySort,
        onTap: () {
          AppFeedback.playInteract(context);
          if (_scrollController.hasClients) {
            _scrollController.jumpTo(0);
          }
          _cubit.toggleSort();
          _showScrollToTop.value = false;
        },
        customBorder: const CircleBorder(),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: 30.borderRadius,
            color: _theme.colorScheme.primaryContainer,
          ),
          padding: 8.paddingHorizontal,
          child: BlocBuilder<HistoryCubit, HistoryState>(
            buildWhen: (p, c) => p.isSortAscending != c.isSortAscending,
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                    _l10n.createTime,
                    style: _theme.textTheme.titleSmall?.copyWith(
                      color: _theme.colorScheme.onPrimaryContainer,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.width,
                  Icon(
                    state.isSortAscending
                        ? Icons.expand_less_outlined
                        : Icons.expand_more_outlined,

                    size: 24,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScrollToTopButton() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showScrollToTop,
      builder: (context, show, child) {
        return AnimatedSize(
          duration: 200.milliseconds,
          curve: Curves.easeInOut,
          child: show
              ? Padding(
                  padding: 12.paddingLeft,
                  child: AppTransparentContainer(
                    onTap: () {
                      AppFeedback.playInteract(context);
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          0,
                          duration: 300.milliseconds,
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    backgroundColor: _theme.colorScheme.primaryContainer,
                    child: const Icon(Icons.expand_less_rounded),
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
