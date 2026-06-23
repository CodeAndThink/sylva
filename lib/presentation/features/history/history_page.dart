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
      if (!_scrollController.hasClients) return;

      final bool shouldShow =
          _scrollController.offset > 200 &&
          _scrollController.position.maxScrollExtent > 0;

      if (_showScrollToTop.value != shouldShow) {
        _showScrollToTop.value = shouldShow;
      }
    });
  }

  void _handleCleanHistory() {
    _cubit.navigator.dialog.showConfirm(
      title: S.of(context).clearAllHistory,
      message: S.of(context).clearAllHistoryConfirm,
      leftText: S.of(context).cancel,
      rightText: S.of(context).delete,
      rightColor: _theme.colorScheme.error,
      onRight: () {
        _cubit.clearHistory();
      },
    );
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

    return AppScaffold(
      title: S.of(context).history,
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
          message: S.of(context).clearAllHistory,
          child: IconButton(
            key: _keyDeleteAll,
            icon: Icon(Icons.auto_delete, color: _theme.colorScheme.error),
            onPressed: () {
              _handleCleanHistory();
            },
          ),
        );
      },
    );
  }

  Widget _buildChangeViewButton() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      buildWhen: (previous, current) =>
          previous.isGridView != current.isGridView,
      builder: (context, state) {
        return Tooltip(
          message: S.of(context).historyView,
          child: IconButton(
            key: _keyChangeView,
            icon: Icon(
              state.isGridView ? Icons.grid_view_rounded : Icons.list_outlined,
            ),
            onPressed: () {
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

        return Stack(
          children: [
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

  Widget _buildBottomActions() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: 16.paddingBottom,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            60.width,
            AppTransparentContainer(
              padding: 4.paddingAll,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: S.of(context).help,
                    child: IconButton(
                      icon: Icon(
                        Icons.help_outline_outlined,
                        color: _theme.colorScheme.onSurface,
                        size: 24,
                      ),
                      onPressed: _showTutorial,
                    ),
                  ),
                  _buildChangeViewButton(),
                  Tooltip(
                    message: S.of(context).onlyFavorites,
                    child: InkWell(
                      key: _keyFavoriteOnly,
                      onTap: () {
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
                          buildWhen: (p, c) =>
                              p.isFavoriteOnly != c.isFavoriteOnly,
                          builder: (context, state) {
                            return Icon(
                              state.isFavoriteOnly
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline_rounded,
                              color: Colors.amber,
                              size: 30,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  8.width,

                  Tooltip(
                    message: S.of(context).historySort,
                    child: InkWell(
                      key: _keySort,
                      onTap: () {
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
                          buildWhen: (p, c) =>
                              p.isSortAscending != c.isSortAscending,
                          builder: (context, state) {
                            return Row(
                              children: [
                                Text(
                                  S.of(context).createTime,
                                  style: _theme.textTheme.titleSmall?.copyWith(
                                    color:
                                        _theme.colorScheme.onPrimaryContainer,
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
                  ),
                ],
              ),
            ),
            12.width,
            ValueListenableBuilder<bool>(
              valueListenable: _showScrollToTop,
              builder: (context, show, child) {
                return AnimatedOpacity(
                  opacity: show ? 1.0 : 0.0,
                  duration: 200.milliseconds,
                  child: IgnorePointer(
                    ignoring: !show,
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        _scrollController.animateTo(
                          0,
                          duration: 300.milliseconds,
                          curve: Curves.easeOut,
                        );
                      },
                      backgroundColor: _theme.colorScheme.primaryContainer,
                      foregroundColor: _theme.colorScheme.onPrimaryContainer,
                      child: const Icon(Icons.arrow_upward),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.black,
      hideSkip: true,
      paddingFocus: 10,
      opacityShadow: 0.8,
    )..show(context: context);
  }

  List<TargetFocus> _createTargets() {
    return [
      if (_cubit.state.records.isNotEmpty)
        _buildTarget(
          key: _keyDeleteAll,
          title: S.of(context).tutorialDeleteAllTitle,
          desc: S.of(context).tutorialDeleteAllDesc,
        ),
      _buildTarget(
        key: _keyChangeView,
        title: S.of(context).tutorialHistoryViewTitle,
        desc: S.of(context).tutorialHistoryViewDesc,
        contentAlign: ContentAlign.top,
      ),
      _buildTarget(
        key: _keyFavoriteOnly,
        title: S.of(context).tutorialFavoritesTitle,
        desc: S.of(context).tutorialFavoritesDesc,
        contentAlign: ContentAlign.top,
      ),
      _buildTarget(
        key: _keySort,
        title: S.of(context).tutorialSortTitle,
        desc: S.of(context).tutorialSortDesc,
        contentAlign: ContentAlign.top,
      ),
    ];
  }

  TargetFocus _buildTarget({
    required GlobalKey key,
    required String title,
    required String desc,
    ContentAlign contentAlign = ContentAlign.bottom,
  }) {
    return TargetFocus(
      identify: key,
      keyTarget: key,
      alignSkip: Alignment.topRight,
      focusAnimationDuration: 400.milliseconds,
      unFocusAnimationDuration: 400.milliseconds,
      contents: [
        TargetContent(
          align: contentAlign,
          builder: (context, controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: _theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text(
                    desc,
                    style: _theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: controller.skip,
                      child: Text(
                        S.of(context).tutorialSkip,
                        style: _theme.textTheme.titleSmall?.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    8.width,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _theme.colorScheme.primary,
                      ),
                      onPressed: controller.next,
                      child: Text(
                        S.of(context).tutorialNext,
                        style: _theme.textTheme.titleSmall?.copyWith(
                          color: _theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
