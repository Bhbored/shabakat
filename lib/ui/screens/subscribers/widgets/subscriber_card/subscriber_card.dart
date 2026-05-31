import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import '../../../dashboard/widgets/common/dashboard_avatar.dart';
import '../info_item/info_item.dart';

class SubscriberCard extends StatelessWidget {
  final Customer customer;

  const SubscriberCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingSmall),
        child: Column(
          children: [
            Row(
              children: [
                DashboardAvatar(name: customer.name),
                SizedBox(width: context.paddingSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        customer.phone ?? '',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                          fontFamily: 'JetBrains Mono',
                        ),
                      ),
                    ],
                  ),
                ),
                _CustomerStatusBadge(status: customer.customerStatus),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            const Divider(),
            SizedBox(height: context.spaceSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoItem(label: 'Address', value: customer.address ?? '-'),
                InfoItem(
                  label: customer.plan.label,
                  value: customer.planValue.toStringAsFixed(2),
                  isBold: true,
                ),
                InfoItem(
                  label: 'Amount',
                  value: '\$${customer.planValue.toStringAsFixed(0)}',
                  isMono: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomerStatusBadge extends StatelessWidget {
  final CustomerStatus status;

  const _CustomerStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      CustomerStatus.active => AppColors.success,
      CustomerStatus.suspended => AppColors.warning,
      CustomerStatus.terminated => AppColors.error,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.25,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            switch (status) {
              CustomerStatus.active => Icons.check_circle_outline,
              CustomerStatus.suspended => Icons.pause_circle_outline,
              CustomerStatus.terminated => Icons.cancel_outlined,
            },
            size: 12,
            color: color,
          ),
          SizedBox(width: context.paddingSmall * 0.5),
          Text(
            status.label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
