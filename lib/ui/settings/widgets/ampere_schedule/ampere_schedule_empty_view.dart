import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/add_ampere_schedule_dialog.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

class AmpereScheduleEmptyView extends ConsumerWidget {
  const AmpereScheduleEmptyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.gauge,
              size: 48,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
            SizedBox(height: context.spaceMedium),
            Text(
              'settings.ampere_schedule.empty'.tr(),
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: context.spaceLarge),
            ElevatedButton.icon(
              onPressed: () => showAppDialog<void>(
                context: context,
                builder: (_) => const AddAmpereScheduleDialog(),
              ),
              icon: const Icon(Icons.add),
              label: Text('settings.ampere_schedule.add'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
