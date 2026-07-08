import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/ampere_schedule/ampere_schedule_provider.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class AmpereScheduleDeleteDialog extends ConsumerStatefulWidget {
  final AmpereSchedule schedule;

  const AmpereScheduleDeleteDialog({super.key, required this.schedule});

  @override
  ConsumerState<AmpereScheduleDeleteDialog> createState() =>
      _AmpereScheduleDeleteDialogState();
}

class _AmpereScheduleDeleteDialogState
    extends ConsumerState<AmpereScheduleDeleteDialog> {
  bool _isLoading = false;

  Future<void> _delete() async {
    setState(() => _isLoading = true);

    try {
      await ref
          .read(ampereScheduleProvider.notifier)
          .deleteAmpereSchedule(widget.schedule.id);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.ampere_schedule.deleted'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'settings.ampere_schedule.delete_failed'.tr();
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppAlertDialog(
      title: Text('settings.ampere_schedule.delete.title'.tr()),
      content: Text(
        'settings.ampere_schedule.delete.message'.tr(
          args: [widget.schedule.name],
        ),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _delete,
          child: _isLoading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('settings.ampere_schedule.delete.confirm'.tr()),
        ),
      ],
    );
  }
}
