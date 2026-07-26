import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_delete_dialog.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/edit_ampere_schedule_dialog.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class AmpereScheduleCardHeader extends StatelessWidget {
  final AmpereSchedule schedule;

  const AmpereScheduleCardHeader({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(context.paddingSmall),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          ),
          child: Icon(LucideIcons.gauge, size: 20, color: colorScheme.primary),
        ),
        SizedBox(width: context.spaceSmall),
        Expanded(
          child: Text(
            schedule.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(LucideIcons.pencil, size: 20),
          onPressed: () => showAppDialog<void>(
            context: context,
            builder: (_) => EditAmpereScheduleDialog(schedule: schedule),
          ),
        ),
        if (schedule.canBeDeleted)
          IconButton(
            icon: Icon(LucideIcons.trash2, size: 20, color: colorScheme.error),
            onPressed: () => showAppDialog<void>(
              context: context,
              builder: (_) => AmpereScheduleDeleteDialog(schedule: schedule),
            ),
          ),
      ],
    );
  }
}
