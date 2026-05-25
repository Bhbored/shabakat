import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/stat_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StatGrid extends StatelessWidget {
  const StatGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final paid = allSubscribers.where((s) => s.status == SubscriberStatus.paid).length;
    final unpaid = allSubscribers.where((s) => s.status != SubscriberStatus.paid).length;
    final overdue = allSubscribers.where((s) => s.status == SubscriberStatus.overdue).length;
    final totalRev = allSubscribers.fold(0, (sum, s) => sum + s.amount);
    final outstanding = allSubscribers.where((s) => s.status != SubscriberStatus.paid).fold(0, (sum, s) => sum + s.amount);
    final rate = allSubscribers.isEmpty ? 0 : ((paid / allSubscribers.length) * 100).round();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'TOTAL SUBSCRIBERS',
                value: allSubscribers.length.toString(),
                trend: '+12 this month',
                icon: LucideIcons.users,
                iconColor: AppColors.primary,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'PAID THIS MONTH',
                value: paid.toString(),
                trend: '$rate% collection rate',
                icon: LucideIcons.userCheck,
                iconColor: const Color(0xFF10B981),
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceSmall),
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'UNPAID INVOICES',
                value: unpaid.toString(),
                trend: '$overdue overdue',
                trendColor: AppColors.error,
                icon: LucideIcons.alertCircle,
                iconColor: AppColors.error,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'MONTHLY REVENUE',
                value: '\$$totalRev',
                trend: '\$$outstanding outstanding',
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
