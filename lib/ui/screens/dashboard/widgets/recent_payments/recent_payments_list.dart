import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/recent_payments/payment_item.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/recent_payments/view_all_button.dart';
import 'package:shabakat/ui/widgets/status_badge.dart';

class RecentPaymentsList extends StatelessWidget {
  const RecentPaymentsList({super.key});

  @override
  Widget build(BuildContext context) {
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
                ViewAllButton(),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            const PaymentItem(
              name: 'Ahmad Khalil',
              area: 'Hamra',
              ampere: '5A',
              amount: '85',
              date: 'Jun 15, 2025',
              status: BadgeStatus.paid,
            ),
            const PaymentItem(
              name: 'Khalid Barakat',
              area: 'Verdun',
              ampere: '5A',
              amount: '85',
              date: 'Jun 20, 2025',
              status: BadgeStatus.paid,
            ),
            const PaymentItem(
              name: 'Hassan Nassar',
              area: 'Mar Elias',
              ampere: '5A',
              amount: '85',
              date: 'Jun 5, 2025',
              status: BadgeStatus.paid,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}
