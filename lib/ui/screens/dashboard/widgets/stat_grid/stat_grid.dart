import 'package:easy_localization/easy_localization.dart';
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
                label: 'dashboard.stat.total_subscribers'.tr(),
                value: customers.total.toString(),
                trend: 'dashboard.stat.active'.tr(
                  args: [customers.active.toString()],
                ),
                icon: LucideIcons.users,
                iconColor: AppColors.primary,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'dashboard.stat.total_collected'.tr(),
                value: _formatMoney(summary.totalCollectedAllTime),
                trend: 'dashboard.stat.collection_rate'.tr(
                  args: [summary.collectionRate.toStringAsFixed(1)],
                ),
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
                label: 'dashboard.stat.unpaid_invoices'.tr(),
                value: unpaidCount.toString(),
                trend: 'dashboard.stat.outstanding'.tr(
                  args: [_formatMoney(unpaidTotal)],
                ),
                trendColor: AppColors.error,
                icon: LucideIcons.alertCircle,
                iconColor: AppColors.error,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: StatCard(
                label: 'dashboard.stat.total_billed'.tr(),
                value: _formatMoney(summary.totalBilledAllTime),
                trend: 'dashboard.stat.all_time_due'.tr(
                  args: [_formatMoney(summary.totalOutstandingAllTime)],
                ),
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
