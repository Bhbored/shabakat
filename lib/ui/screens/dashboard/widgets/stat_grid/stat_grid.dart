import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/stat_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StatGrid extends StatelessWidget {
  const StatGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: StatCard(
                label: 'TOTAL SUBSCRIBERS',
                value: '15',
                trend: '+12 this month',
                icon: LucideIcons.users,
                iconColor: Colors.blue,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            const Expanded(
              child: StatCard(
                label: 'PAID THIS MONTH',
                value: '10',
                trend: '67% collection rate',
                icon: LucideIcons.userCheck,
                iconColor: Color(0xFF10B981), // Emerald
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceSmall),
        Row(
          children: [
            const Expanded(
              child: StatCard(
                label: 'UNPAID INVOICES',
                value: '5',
                trend: '3 overdue',
                trendColor: Colors.red,
                icon: LucideIcons.alertCircle,
                iconColor: Colors.red,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            const Expanded(
              child: StatCard(
                label: 'MONTHLY REVENUE',
                value: '\$2,450',
                trend: '\$850 outstanding',
                icon: LucideIcons.dollarSign,
                isAccent: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
