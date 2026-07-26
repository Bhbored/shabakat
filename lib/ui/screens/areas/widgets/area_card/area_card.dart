import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/area_details_screen.dart';
import '../customer_count_badge/customer_count_badge.dart';

class AreaCard extends StatelessWidget {
  final Area area;
  final bool readOnly;

  const AreaCard({
    super.key,
    required this.area,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            openInnerScreen(
              widget: AreaDetailsScreen(area: area, readOnly: readOnly),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(context.paddingLarge),
          child: Row(
          children: [
            DashboardAvatar(name: area.name),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    area.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'areas.created'.tr(args: [_formatDate(area.createdAt)]),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            CustomerCountBadge(count: area.customerCount),
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
