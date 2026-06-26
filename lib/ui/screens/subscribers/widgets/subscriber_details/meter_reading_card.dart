import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';

import 'meter_reading_delete_dialog.dart';

class MeterReadingCard extends StatelessWidget {
  final String customerId;
  final MeterReading reading;

  const MeterReadingCard({
    super.key,
    required this.customerId,
    required this.reading,
  });

  String _formatDateTime(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/${date.year} $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    reading.readingValue.toStringAsFixed(2),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (reading.consumption != null)
                  Text(
                    '${reading.consumption!.toStringAsFixed(2)} kWh',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => showMeterReadingDeleteDialog(
                    context: context,
                    customerId: customerId,
                    readingId: reading.id,
                    readingValue: reading.readingValue,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            Row(
              children: [
                Icon(
                  LucideIcons.clock,
                  size: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.45),
                ),
                SizedBox(width: context.spaceSmall * 0.5),
                Expanded(
                  child: Text(
                    _formatDateTime(reading.createdAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
