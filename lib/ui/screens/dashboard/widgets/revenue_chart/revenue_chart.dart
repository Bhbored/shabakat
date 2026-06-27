import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';

import 'financial_bar.dart';
import 'financial_bar_chart.dart';

class RevenueChart extends StatelessWidget {
  final DashboardSummaryResponse summary;

  const RevenueChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'dashboard.financial_summary.title'.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'dashboard.financial_summary.subtitle'.tr(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            SizedBox(height: context.spaceMedium),
            FinancialBarChart(bars: _financialBars(colorScheme)),
          ],
        ),
      ),
    );
  }

  List<FinancialBar> _financialBars(ColorScheme colorScheme) {
    return [
      FinancialBar(
        label: 'dashboard.financial_summary.billed'.tr(),
        value: summary.totalBilledAllTime,
        color: colorScheme.primary,
      ),
      FinancialBar(
        label: 'dashboard.financial_summary.collected'.tr(),
        value: summary.totalCollectedAllTime,
        color: AppColors.success,
      ),
      FinancialBar(
        label: 'dashboard.financial_summary.due'.tr(),
        value: summary.totalOutstandingAllTime,
        color: AppColors.error,
      ),
      FinancialBar(
        label: 'dashboard.financial_summary.expenses'.tr(),
        value: summary.totalExpensesAllTime,
        color: AppColors.chartExpenses,
      ),
      FinancialBar(
        label: 'dashboard.financial_summary.net'.tr(),
        value: summary.netIncomeAllTime,
        color: summary.netIncomeAllTime >= 0
            ? AppColors.success
            : AppColors.error,
      ),
    ];
  }
}
