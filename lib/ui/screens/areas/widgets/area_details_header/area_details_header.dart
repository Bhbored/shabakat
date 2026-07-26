import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

import '../area_detail_stat_chip/area_detail_stat_chip.dart';

class AreaDetailsHeader extends ConsumerWidget {
  final Area area;
  final bool showBoxes;
  final ValueChanged<bool> onViewChanged;

  const AreaDetailsHeader({
    super.key,
    required this.area,
    required this.showBoxes,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filter = ref.watch(distributionBoxFilterProvider);
    final boxesAsync = ref.watch(distributionBoxProvider);
    final pagination = ref.watch(distributionBoxPaginationProvider);

    final boxCountReady =
        showBoxes &&
        filter.areaId == area.id &&
        boxesAsync.hasValue &&
        !boxesAsync.isLoading &&
        !boxesAsync.isRefreshing;
    final boxCount = boxCountReady ? pagination.totalCount : null;

    final countLabel = showBoxes
        ? (boxCount == null
              ? 'areas.box_count'.tr(args: ['…'])
              : boxCount == 1
              ? 'areas.box_count_one'.tr()
              : 'areas.box_count'.tr(args: [boxCount.toString()]))
        : (area.customerCount == 1
              ? 'areas.subscriber_count_one'.tr()
              : 'areas.subscriber_count'.tr(
                  args: [area.customerCount.toString()],
                ));

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
                DashboardAvatar(name: area.name, size: 56),
                SizedBox(width: context.paddingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              area.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: context.spaceSmall),
                          _AreaViewSwitch(
                            showBoxes: showBoxes,
                            onChanged: onViewChanged,
                          ),
                        ],
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
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Wrap(
              spacing: context.spaceMedium,
              runSpacing: context.spaceSmall,
              children: [
                AreaDetailStatChip(
                  icon: Icons.calendar_today_outlined,
                  label: 'areas.details.created'.tr(),
                  value: _formatDate(area.createdAt),
                ),
                AreaDetailStatChip(
                  icon: Icons.update_outlined,
                  label: 'areas.details.updated'.tr(),
                  value: _formatDate(area.updatedAt),
                ),
                AreaDetailStatChip(
                  icon: showBoxes
                      ? Icons.inventory_2_outlined
                      : Icons.people_outline,
                  label: showBoxes
                      ? 'areas.details.boxes'.tr()
                      : 'areas.details.subscribers'.tr(),
                  value: showBoxes
                      ? (boxCount?.toString() ?? '…')
                      : area.customerCount.toString(),
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

class _AreaViewSwitch extends StatelessWidget {
  final bool showBoxes;
  final ValueChanged<bool> onChanged;

  const _AreaViewSwitch({
    required this.showBoxes,
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
          'areas.details.switch_subscribers'.tr(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: showBoxes ? 0.45 : 1,
            ),
            fontWeight: showBoxes ? null : FontWeight.w600,
          ),
        ),
        Switch(
          value: showBoxes,
          onChanged: onChanged,
        ),
        Text(
          'areas.details.switch_boxes'.tr(),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(
              alpha: showBoxes ? 1 : 0.45,
            ),
            fontWeight: showBoxes ? FontWeight.w600 : null,
          ),
        ),
      ],
    );
  }
}
