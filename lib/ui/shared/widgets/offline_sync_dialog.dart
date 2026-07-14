import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/utilities/offline_syncer.dart';
import 'package:shabakat/data/providers/streams/syncing_progress.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showOfflineSyncDialog({required BuildContext context}) {
  return showAppDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const OfflineSyncDialog(),
  );
}

class OfflineSyncDialog extends ConsumerStatefulWidget {
  const OfflineSyncDialog({super.key});

  @override
  ConsumerState<OfflineSyncDialog> createState() => _OfflineSyncDialogState();
}

enum _OfflineSyncStep { confirm, syncing, success, error }

class _OfflineSyncDialogState extends ConsumerState<OfflineSyncDialog> {
  _OfflineSyncStep _step = _OfflineSyncStep.confirm;

  Future<void> _startSync() async {
    setState(() => _step = _OfflineSyncStep.syncing);

    ref.invalidate(offlineSyncerProvider);
    ref.invalidate(syncingProgressProvider);

    try {
      await ref.read(offlineSyncerProvider).sync();
      if (!mounted) return;
      setState(() => _step = _OfflineSyncStep.success);
      AppSnackBar.show(
        context,
        message: 'drawer.offline_sync.success_snackbar'.tr(),
        variant: AppSnackBarVariant.success,
      );
    } catch (_) {
      if (!mounted) return;
      setState(() => _step = _OfflineSyncStep.error);
      AppSnackBar.show(
        context,
        message: 'drawer.offline_sync.failed'.tr(),
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progressAsync = ref.watch(syncingProgressProvider);
    final progress = progressAsync.asData?.value ?? 0.0;
    final isBusy = _step == _OfflineSyncStep.syncing;

    return PopScope(
      canPop: !isBusy,
      child: AppAlertDialog(
        title: Row(
          children: [
            Icon(LucideIcons.refreshCw, color: colorScheme.primary, size: 22),
            SizedBox(width: context.spaceSmall),
            Expanded(child: Text('drawer.offline_sync.title'.tr())),
          ],
        ),
        content: switch (_step) {
          _OfflineSyncStep.confirm => Text(
            'drawer.offline_sync.description'.tr(),
            style: theme.textTheme.bodyMedium,
          ),
          _OfflineSyncStep.syncing => _SyncProgressContent(progress: progress),
          _OfflineSyncStep.success => Text(
            'drawer.offline_sync.success'.tr(),
            style: theme.textTheme.bodyMedium,
          ),
          _OfflineSyncStep.error => Text(
            'drawer.offline_sync.failed'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.error,
            ),
          ),
        },
        actions: switch (_step) {
          _OfflineSyncStep.confirm => [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('drawer.offline_sync.cancel'.tr()),
            ),
            ElevatedButton(
              onPressed: _startSync,
              child: Text('drawer.offline_sync.start'.tr()),
            ),
          ],
          _OfflineSyncStep.syncing => const [],
          _OfflineSyncStep.success => [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('drawer.offline_sync.done'.tr()),
            ),
          ],
          _OfflineSyncStep.error => [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('drawer.offline_sync.close'.tr()),
            ),
            ElevatedButton(
              onPressed: _startSync,
              child: Text('drawer.offline_sync.try_again'.tr()),
            ),
          ],
        },
      ),
    );
  }
}

class _SyncProgressContent extends StatelessWidget {
  final double progress;

  const _SyncProgressContent({required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clamped = progress.clamp(0.0, 1.0);
    final percent = (clamped * 100).round();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'drawer.offline_sync.syncing'.tr(),
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        LinearProgressIndicator(value: clamped),
        SizedBox(height: context.spaceSmall),
        Text(
          '$percent%',
          style: theme.textTheme.labelLarge,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
