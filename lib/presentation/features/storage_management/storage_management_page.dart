import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/file_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/storage_management/storage_management_navigator.dart';
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

  @override
  void initState() {
    super.initState();
    _cubit = context.read<StorageManagementCubit>();
    _cubit.calculateStorage();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);

    return AppScaffold(
      title: l10n.storageManagement,
      body: BlocBuilder<StorageManagementCubit, StorageManagementState>(
        builder: (context, state) {
          if (state.status.isLoading && state.totalSizeInBytes == 0) {
            return Center(
              child: SpinKitRipple(
                color: theme.colorScheme.primary,
                size: MediaQuery.sizeOf(context).width * 0.5,
              ),
            );
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
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
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
                        color: theme.colorScheme.primary,
                      ),
                      8.height,
                      Text(
                        formattedSize,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      4.height,
                      Text(
                        l10n.savedImagesStorage,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
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
                context: context,
                title: l10n.clearUnfavoritedHistory,
                subtitle: l10n.clearUnfavoritedHistorySubtitle,
                icon: Icons.heart_broken_rounded,
                color: theme.colorScheme.secondary,
                onTap: () => _showConfirmDialog(
                  context,
                  title: l10n.confirmDeletion,
                  content: l10n.confirmDeleteUnfavoritedDesc,
                  onConfirm: () =>
                      context.read<StorageManagementCubit>().clearUnfavorited(),
                ),
              ),
              16.height,
              _buildActionButton(
                context: context,
                title: l10n.clearAllHistory,
                subtitle: l10n.clearAllHistorySubtitle,
                icon: Icons.delete_forever_rounded,
                color: theme.colorScheme.error,
                onTap: () => _showConfirmDialog(
                  context,
                  title: l10n.confirmClearAll,
                  content: l10n.confirmClearAllDesc,
                  onConfirm: () =>
                      context.read<StorageManagementCubit>().clearAll(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
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
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    4.height,
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
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
    );
  }

  void _showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: Text(l10n.cancelBtn),
            onPressed: () => Navigator.pop(ctx),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(l10n.deleteBtn),
          ),
        ],
      ),
    );
  }
}
