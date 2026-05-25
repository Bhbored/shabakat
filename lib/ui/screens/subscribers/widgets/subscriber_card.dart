import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import '../../../widgets/status_badge.dart';
import '../../dashboard/widgets/common/dashboard_avatar.dart';

class SubscriberCard extends StatelessWidget {
  final String name;
  final String phone;
  final String area;
  final String ampere;
  final String date;
  final String status;
  final String amount;

  const SubscriberCard({
    super.key,
    required this.name,
    required this.phone,
    required this.area,
    required this.ampere,
    required this.date,
    required this.status,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    BadgeStatus badgeStatus;
    switch (status.toLowerCase()) {
      case 'paid': badgeStatus = BadgeStatus.paid; break;
      case 'unpaid': badgeStatus = BadgeStatus.unpaid; break;
      case 'overdue': badgeStatus = BadgeStatus.overdue; break;
      default: badgeStatus = BadgeStatus.unpaid;
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingSmall),
        child: Column(
          children: [
            Row(
              children: [
                DashboardAvatar(name: name),
                SizedBox(width: context.paddingSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        phone,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                          fontFamily: 'JetBrains Mono',
                        ),
                      ),
                    ],
                  ),
                ),
                StatusBadge(status: badgeStatus),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            const Divider(),
            SizedBox(height: context.spaceSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoItem(label: 'Area', value: area),
                _InfoItem(label: 'Ampere', value: ampere, isBold: true),
                _InfoItem(label: 'Amount', value: '\$$amount', isMono: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final bool isMono;

  const _InfoItem({
    required this.label,
    required this.value,
    this.isBold = false,
    this.isMono = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontFamily: isMono ? 'JetBrains Mono' : null,
            color: isBold ? theme.primaryColor : colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
