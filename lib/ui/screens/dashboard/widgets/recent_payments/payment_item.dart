import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/widgets/status_badge.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

class PaymentItem extends StatelessWidget {
  final String name;
  final String area;
  final String ampere;
  final String amount;
  final String date;
  final BadgeStatus status;
  final bool isLast;

  const PaymentItem({
    super.key,
    required this.name,
    required this.area,
    required this.ampere,
    required this.amount,
    required this.date,
    required this.status,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.spaceSmall),
      decoration: BoxDecoration(
        border: isLast ? null : Border(
          bottom: BorderSide(color: colorScheme.outline),
        ),
      ),
      child: Row(
        children: [
          DashboardAvatar(name: name),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '$area · $ampere',
                  style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.6)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$amount',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Text(
                date,
                style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.6)),
              ),
            ],
          ),
          SizedBox(width: context.paddingSmall),
          StatusBadge(status: status),
        ],
      ),
    );
  }
}
