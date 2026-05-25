import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import '../../../../widgets/status_badge.dart';
import '../../../dashboard/widgets/common/dashboard_avatar.dart';
import '../info_item/info_item.dart';

class SubscriberCard extends StatelessWidget {
  final Subscriber subscriber;

  const SubscriberCard({
    super.key,
    required this.subscriber,
  });

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
                DashboardAvatar(name: subscriber.name),
                SizedBox(width: context.paddingSmall),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subscriber.name,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subscriber.phone,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                          fontFamily: 'JetBrains Mono',
                        ),
                      ),
                    ],
                  ),
                ),
                StatusBadge(status: subscriber.status),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            const Divider(),
            SizedBox(height: context.spaceSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoItem(label: 'Area', value: subscriber.area),
                InfoItem(label: 'Ampere', value: subscriber.ampere, isBold: true),
                InfoItem(label: 'Amount', value: '\$${subscriber.amount}', isMono: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
