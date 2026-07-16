import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/file_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/storage_management/storage_management_navigator.dart';
import 'package:sylva/presentation/widgets/dialogs/app_dialog.dart';
import 'package:sylva/presentation/widgets/loadings/app_loading.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'storage_management_cubit.dart';
import 'storage_management_state.dart';

class StorageManagementPage extends StatelessWidget {
  const StorageManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StorageManagementCubit(
        navigator: StorageManagementNavigator(context),
      ),
      child: const _StorageManagementChildPage(),
    );
  }
}

class _StorageManagementChildPage extends StatefulWidget {
  const _StorageManagementChildPage();

  @override
  State<_StorageManagementChildPage> createState() =>
      __StorageManagementChildPageState();
}

class __StorageManagementChildPageState
    extends State<_StorageManagementChildPage> {
  late final StorageManagementCubit _cubit;
  late ThemeData _theme;
  late S _l10n;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<StorageManagementCubit>();
    _cubit.calculateStorage();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _l10n = S.of(context);

    return AppScaffold(title: _l10n.storageManagement, body: _buildBody());
  }

  Widget _buildBody() {
    return BlocBuilder<StorageManagementCubit, StorageManagementState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.totalSizeInBytes != current.totalSizeInBytes,
      builder: (context, state) {
        if (state.status.isLoading && state.totalSizeInBytes == 0) {
          return const AppLoading();
        }

        final formattedSize = FileUtils.formatBytes(state.totalSizeInBytes);

        return ListView(
          padding: EdgeInsets.fromLTRB(
            24,
            MediaQuery.of(context).padding.top + 72,
            24,
            MediaQuery.of(context).padding.bottom + 24,
          ),
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _theme.colorScheme.primary.withValues(alpha: 0.2),
                  width: 12,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.storage_rounded,
                      size: 48,
                      color: _theme.colorScheme.primary,
                    ),
                    8.height,
                    Text(
                      formattedSize,
                      style: _theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _theme.colorScheme.primary,
                      ),
                    ),
                    4.height,
                    Text(
                      _l10n.savedImagesStorage,
                      style: _theme.textTheme.bodyMedium?.copyWith(
                        color: _theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            48.height,
            _buildActionButton(
              title: _l10n.clearUnfavoritedHistory,
              subtitle: _l10n.clearUnfavoritedHistorySubtitle,
              icon: Icons.heart_broken_rounded,
              color: _theme.colorScheme.secondary,
              onTap: () => _showConfirmDialog(
                context,
                title: _l10n.confirmDeletion,
                content: _l10n.confirmDeleteUnfavoritedDesc,
                onConfirm: () => _cubit.clearUnfavorited(),
              ),
            ),
            16.height,
            _buildActionButton(
              title: _l10n.clearAllHistory,
              subtitle: _l10n.clearAllHistorySubtitle,
              icon: Icons.delete_forever_rounded,
              color: _theme.colorScheme.error,
              onTap: () => _showConfirmDialog(
                context,
                title: _l10n.confirmClearAll,
                content: _l10n.confirmClearAllDesc,
                onConfirm: () => _cubit.clearAll(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: title,
      child: Material(
        color: color.withValues(alpha: 0.1),
        borderRadius: 16.borderRadius,
        child: InkWell(
          borderRadius: 16.borderRadius,
          onTap: onTap,
          child: Padding(
            padding: 16.paddingAll,
            child: Row(
              children: [
                Container(
                  padding: 12.paddingAll,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
                16.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: _theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _theme.colorScheme.onSurface,
                        ),
                      ),
                      4.height,
                      Text(
                        subtitle,
                        style: _theme.textTheme.bodySmall?.copyWith(
                          color: _theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    VoidCallback? onConfirm,
  }) {
    final l10n = S.of(context);
    AppDialog(context).showConfirm(
      title: title,
      message: content,
      leftText: l10n.cancelBtn,
      rightText: l10n.deleteBtn,
      rightColor: _theme.colorScheme.error,
      onRight: onConfirm,
    );
  }
}
