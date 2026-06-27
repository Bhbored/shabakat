import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/stat_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

String _formatMoney(double value) => '\$${value.toStringAsFixed(2)}';

class StatGrid extends StatelessWidget {
  final DashboardSummaryResponse summary;

  const StatGrid({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final customers = summary.customers;
    final invoices = summary.invoices;
    final unpaidCount = invoices.unpaidCount + invoices.partiallyPaidCount;
    final unpaidTotal = invoices.unpaidTotal + invoices.partiallyPaidTotal;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'TOTAL SUBSCRIBERS',
                value: customers.total.toString(),
                trend: '${customers.active} active',
                icon: LucideIcons.users,
                iconColor: AppColors.primary,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'TOTAL COLLECTED',
                value: _formatMoney(summary.totalCollectedAllTime),
                trend: '${summary.collectionRate.toStringAsFixed(1)}% collection rate',
                icon: LucideIcons.userCheck,
                iconColor: AppColors.success,
              ),
            ),
          ],
        ),
        SizedBox(height: context.paddingSmall),
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'UNPAID INVOICES',
                value: unpaidCount.toString(),
                trend: '${_formatMoney(unpaidTotal)} outstanding',
                trendColor: AppColors.error,
                icon: LucideIcons.alertCircle,
                iconColor: AppColors.error,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'TOTAL BILLED',
                value: _formatMoney(summary.totalBilledAllTime),
                trend:
                    '${_formatMoney(summary.totalOutstandingAllTime)} all-time due',
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
