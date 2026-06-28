import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';

Future<void> showMeterReadingDeleteDialog({
  required BuildContext context,
  required String customerId,
  required String readingId,
  required double readingValue,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => MeterReadingDeleteDialog(
      customerId: customerId,
      readingId: readingId,
      readingValue: readingValue,
    ),
  );
}

class MeterReadingDeleteDialog extends ConsumerWidget {
  final String customerId;
  final String readingId;
  final double readingValue;

  const MeterReadingDeleteDialog({
    super.key,
    required this.customerId,
    required this.readingId,
    required this.readingValue,
  });

  Future<void> _onDelete(BuildContext context, WidgetRef ref) async {
    try {
      await ref
          .read(meterReadingProvider(customerId).notifier)
          .deleteMeterReading(readingId);
    } catch (_) {}
    if (!context.mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDeleting =
        ref.watch(meterReadingProvider(customerId)).isLoading;

    return AlertDialog(
      title: Text('subscribers.meter_readings.delete_title'.tr()),
      content: Text(
        'subscribers.meter_readings.delete_message'.tr(
          args: [readingValue.toStringAsFixed(2)],
        ),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : () => _onDelete(context, ref),
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('subscribers.actions.delete'.tr()),
        ),
      ],
    );
  }
}
