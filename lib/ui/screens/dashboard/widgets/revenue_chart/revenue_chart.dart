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
              'Financial Summary',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Total billings, collections, expenses, and net income for the entire period for the current company.',
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
        label: 'Billed',
        value: summary.totalBilledAllTime,
        color: colorScheme.primary,
      ),
      FinancialBar(
        label: 'Collected',
        value: summary.totalCollectedAllTime,
        color: AppColors.success,
      ),
      FinancialBar(
        label: 'Due',
        value: summary.totalOutstandingAllTime,
        color: AppColors.error,
      ),
      FinancialBar(
        label: 'Expenses',
        value: summary.totalExpensesAllTime,
        color: colorScheme.tertiary,
      ),
      FinancialBar(
        label: 'Net',
        value: summary.netIncomeAllTime,
        color: colorScheme.inversePrimary,
      ),
    ];
  }
}
