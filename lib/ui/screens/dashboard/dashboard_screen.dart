import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'widgets/stat_grid/stat_grid.dart';
import 'widgets/revenue_chart/revenue_chart.dart';
import 'widgets/recent_payments/recent_payments_list.dart';
import 'widgets/upcoming_due/upcoming_due_list.dart';

class DashboardScreen extends StatelessWidget {
  final VoidCallback? onViewAllPayments;
  final VoidCallback? onSendReminders;

  const DashboardScreen({
    super.key,
    this.onViewAllPayments,
    this.onSendReminders,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatGrid(),
          SizedBox(height: context.spaceMedium),
          const RevenueChart(),
          SizedBox(height: context.spaceMedium),
          RecentPaymentsList(onViewAll: onViewAllPayments),
          SizedBox(height: context.spaceMedium),
          UpcomingDueList(onSendReminders: onSendReminders),
          SizedBox(height: context.scrollPaddingAboveMainNav),
        ],
      ),
    );
  }
}
