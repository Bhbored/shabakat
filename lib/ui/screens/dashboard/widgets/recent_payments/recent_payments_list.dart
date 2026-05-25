import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/recent_payments/payment_item.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/recent_payments/view_all_button.dart';

class RecentPaymentsList extends StatelessWidget {
  final VoidCallback? onViewAll;

  const RecentPaymentsList({super.key, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    final paid = allSubscribers.where((s) => s.status == SubscriberStatus.paid).take(5).toList();

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Payments',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                ViewAllButton(onPressed: onViewAll),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            ...paid.asMap().entries.map((entry) {
              final s = entry.value;
              final isLast = entry.key == paid.length - 1;
              return PaymentItem(
                name: s.name,
                area: s.area,
                ampere: s.ampere,
                amount: s.amount.toString(),
                date: s.dueDate,
                status: s.status,
                isLast: isLast,
              );
            }),
          ],
        ),
      ),
    );
  }
}
