import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

class DistributionBoxDetailsHeader extends ConsumerWidget {
  final DistributionBox box;
  final bool showCables;
  final ValueChanged<bool> onViewChanged;

  const DistributionBoxDetailsHeader({
    super.key,
    required this.box,
    required this.showCables,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final totalCount = ref.watch(customerPaginationProvider).totalCount;
    final countLabel = showCables
        ? (totalCount == 1
            ? 'distribution_boxes.cable_count_one'.tr()
            : 'distribution_boxes.cable_count'.tr(
                args: [totalCount.toString()],
              ))
        : (box.customerCount == 1
            ? 'distribution_boxes.subscriber_count_one'.tr()
            : 'distribution_boxes.subscriber_count'.tr(
                args: [box.customerCount.toString()],
              ));

    final areaName = box.areaName.trim();
    final locationNote = box.locationNote?.trim();
    final notes = box.notes?.trim();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer.withValues(alpha: 0.45),
            colorScheme.surface,
          ],
          stops: const [0.0, 1.0],
        ),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.paddingMedium,
          context.paddingMedium,
          context.paddingMedium,
          context.paddingLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DashboardAvatar(name: box.name, size: 56),
                SizedBox(width: context.paddingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        box.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: context.spaceSmall * 0.25),
                      Text(
                        countLabel,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.65),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.spaceSmall),
                _DistributionBoxDetailsViewSwitch(
                  showCables: showCables,
                  onChanged: onViewChanged,
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Wrap(
              spacing: context.spaceSmall,
              runSpacing: context.spaceSmall,
              children: [
                if (areaName.isNotEmpty)
                  _DistributionBoxMetaChip(
                    icon: Icons.map_outlined,
                    labelKey: 'distribution_boxes.form.area',
                    value: areaName,
                  ),
                if (locationNote != null && locationNote.isNotEmpty)
                  _DistributionBoxMetaChip(
                    icon: Icons.place_outlined,
                    labelKey: 'distribution_boxes.form.location_note',
                    value: locationNote,
                  ),
                if (notes != null && notes.isNotEmpty)
                  _DistributionBoxMetaChip(
                    icon: Icons.sticky_note_2_outlined,
                    labelKey: 'distribution_boxes.form.notes',
                    value: notes,
                    maxLines: 3,
                  ),
                _DistributionBoxMetaChip(
                  icon: Icons.calendar_today_outlined,
                  labelKey: 'distribution_boxes.details.created',
                  value: _formatDate(box.createdAt),
                ),
                _DistributionBoxMetaChip(
                  icon: showCables
                      ? Icons.cable_outlined
                      : Icons.people_outline,
                  labelKey: showCables
                      ? 'distribution_boxes.details.cables'
                      : 'distribution_boxes.details.subscribers',
                  value: showCables
                      ? totalCount.toString()
                      : box.customerCount.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}

class _DistributionBoxMetaChip extends StatelessWidget {
  final IconData icon;
  final String labelKey;
  final String value;
  final int maxLines;

  const _DistributionBoxMetaChip({
    required this.icon,
    required this.labelKey,
    required this.value,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      constraints: BoxConstraints(maxWidth: context.screenWidth * 0.44),
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.75,
      ),
      decoration: ControlsThemes.statChipDecoration(colorScheme),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          SizedBox(width: context.paddingSmall * 0.5),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelKey.tr(),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSecondary,
                  ),
                ),
                SizedBox(height: context.spaceSmall * 0.5),
                Text(
                  value,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DistributionBoxDetailsViewSwitch extends StatelessWidget {
  final bool showCables;
  final ValueChanged<bool> onChanged;

  const _DistributionBoxDetailsViewSwitch({
    required this.showCables,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'distribution_boxes.details.switch_subscribers'.tr(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: showCables ? 0.45 : 1,
            ),
            fontWeight: showCables ? null : FontWeight.w600,
          ),
        ),
        Switch(
          value: showCables,
          onChanged: onChanged,
        ),
        Text(
          'distribution_boxes.details.switch_cables'.tr(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: showCables ? 1 : 0.45,
            ),
            fontWeight: showCables ? FontWeight.w600 : null,
          ),
        ),
      ],
    );
  }
}
