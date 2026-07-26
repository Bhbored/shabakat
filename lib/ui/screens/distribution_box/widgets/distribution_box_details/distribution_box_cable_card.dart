import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../../subscribers/subscreens/subscriber_details_screen.dart';

class DistributionBoxCableCard extends StatelessWidget {
  final Customer customer;

  const DistributionBoxCableCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cableName = customer.cableName?.trim();
    final displayCable = cableName != null && cableName.isNotEmpty
        ? cableName
        : 'subscribers.empty_value'.tr();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            openInnerScreen(
              widget: SubscriberDetailsScreen(customerId: customer.id),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(context.paddingLarge),
          child: Row(
            children: [
              DashboardAvatar(name: displayCable),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayCable,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      customer.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
