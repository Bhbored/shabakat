import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import '../../../dashboard/widgets/common/dashboard_avatar.dart';
import 'customer_status_badge.dart';
import 'customer_type_icon.dart';

class SubscriberCardHeader extends StatelessWidget {
  final Customer customer;

  const SubscriberCardHeader({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
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
        CustomerTypeIcon(type: customer.customerType),
        SizedBox(width: context.paddingSmall),
        CustomerStatusBadge(status: customer.customerStatus),
      ],
    );
  }
}
