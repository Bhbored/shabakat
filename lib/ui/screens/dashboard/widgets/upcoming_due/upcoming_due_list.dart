import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/due_item.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/pending_badge.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/send_reminders_button.dart';
import 'package:shabakat/ui/widgets/status_badge.dart';

class UpcomingDueList extends StatelessWidget {
  const UpcomingDueList({super.key});

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
                  'Upcoming Due',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                PendingBadge(count: 5),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            DueItem(
              name: 'Rania Mansour',
              amount: '150',
              date: 'May 28, 2025',
              status: BadgeStatus.unpaid,
            ),
            DueItem(
              name: 'Lara Haddad',
              amount: '210',
              date: 'May 10, 2025',
              status: BadgeStatus.overdue,
            ),
            DueItem(
              name: 'Nadia Rizk',
              amount: '150',
              date: 'May 25, 2025',
              status: BadgeStatus.unpaid,
              isLast: true,
            ),
            SizedBox(height: context.spaceMedium),
            SendRemindersButton(),
          ],
        ),
      ),
    );
  }
}
