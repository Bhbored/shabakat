import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';

import '../subscriber_card/customer_status_badge.dart';
import '../subscriber_card/customer_type_icon.dart';

class SubscriberDetailsHeader extends StatelessWidget {
  final Customer customer;

  const SubscriberDetailsHeader({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
        ),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
      ),
      padding: EdgeInsets.all(context.paddingMedium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardAvatar(name: customer.name, size: 56),
          SizedBox(width: context.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (customer.phone != null && customer.phone!.isNotEmpty) ...[
                  SizedBox(height: context.spaceSmall * 0.25),
                  Text(
                    customer.phone!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.65),
                      fontFamily: 'JetBrains Mono',
                    ),
                  ),
                ],
                SizedBox(height: context.spaceSmall),
                Wrap(
                  spacing: context.paddingSmall,
                  runSpacing: context.paddingSmall,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomerStatusBadge(status: customer.customerStatus),
                    CustomerTypeIcon(type: customer.customerType),
                    Text(
                      customer.customerType.label,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
