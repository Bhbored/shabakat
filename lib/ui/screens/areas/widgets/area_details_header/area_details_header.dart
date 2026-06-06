import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

import '../area_detail_stat_chip/area_detail_stat_chip.dart';

class AreaDetailsHeader extends StatelessWidget {
  final Area area;

  const AreaDetailsHeader({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final subscriberLabel = area.customerCount == 1
        ? '1 subscriber'
        : '${area.customerCount} subscribers';

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
                      Text(
                        area.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: context.spaceSmall * 0.25),
                      Text(
                        subscriberLabel,
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
                  label: 'Created',
                  value: _formatDate(area.createdAt),
                ),
                AreaDetailStatChip(
                  icon: Icons.update_outlined,
                  label: 'Updated',
                  value: _formatDate(area.updatedAt),
                ),
                AreaDetailStatChip(
                  icon: Icons.people_outline,
                  label: 'Subscribers',
                  value: area.customerCount.toString(),
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
