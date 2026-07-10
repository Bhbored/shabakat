import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/areas/widgets/customer_count_badge/customer_count_badge.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

class DistributionBoxCard extends StatelessWidget {
  final DistributionBox box;
  final VoidCallback? onTap;

  const DistributionBoxCard({super.key, required this.box, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.paddingLarge),
          child: Row(
            children: [
              DashboardAvatar(name: box.name),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      box.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      box.areaName,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    if (box.locationNote != null &&
                        box.locationNote!.trim().isNotEmpty) ...[
                      SizedBox(height: context.spaceSmall),
                      Text(
                        box.locationNote!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                    Text(
                      'distribution_boxes.created'.tr(
                        args: [_formatDate(box.createdAt)],
                      ),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              CustomerCountBadge(count: box.customerCount),
            ],
          ),
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
