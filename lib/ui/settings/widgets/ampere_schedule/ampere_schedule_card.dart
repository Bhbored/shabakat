import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/edit_ampere_schedule_dialog.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class AmpereScheduleCard extends StatelessWidget {
  final AmpereSchedule schedule;

  const AmpereScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingLarge),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(context.paddingSmall),
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              ),
              child: Icon(LucideIcons.gauge, size: 20, color: colorScheme.primary),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    schedule.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'settings.ampere_schedule.hours_price'.tr(
                      args: [
                        '${schedule.hoursPerDay}',
                        '${schedule.pricePerAmp}',
                      ],
                    ),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${schedule.customerCount}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                Text(
                  'settings.ampere_schedule.customers'.tr(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(LucideIcons.pencil),
              onPressed: () => showAppDialog<void>(
                context: context,
                builder: (_) => EditAmpereScheduleDialog(schedule: schedule),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
