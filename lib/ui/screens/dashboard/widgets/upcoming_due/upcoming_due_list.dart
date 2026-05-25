import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/due_item.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/pending_badge.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/send_reminders_button.dart';

class UpcomingDueList extends StatelessWidget {
  final VoidCallback? onSendReminders;

  const UpcomingDueList({super.key, this.onSendReminders});

  @override
  Widget build(BuildContext context) {
    final pending = allSubscribers.where((s) => s.status != SubscriberStatus.paid).toList();

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
                PendingBadge(count: pending.length),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            ...pending.take(5).toList().asMap().entries.map((entry) {
              final s = entry.value;
              final isLast = entry.key == pending.take(5).length - 1;
              return DueItem(
                name: s.name,
                amount: s.amount.toString(),
                date: s.dueDate,
                status: s.status,
                isLast: isLast,
              );
            }),
            SizedBox(height: context.spaceMedium),
            SendRemindersButton(onPressed: onSendReminders),
          ],
        ),
      ),
    );
  }
}
