import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/customer_overview_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/expenses_by_type_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/invoice_overview_response.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/recent_payments/recent_payments_list.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/revenue_chart/revenue_chart.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/stat_grid/stat_grid.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/upcoming_due_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  static const _mockSummary = DashboardSummaryResponse(
    totalBilledAllTime: 12500,
    totalCollectedAllTime: 9800,
    totalOutstandingAllTime: 2700,
    collectionRate: 78.4,
    totalExpensesAllTime: 3200,
    netIncomeAllTime: 6600,
    customers: CustomerOverviewResponse(
      total: 128,
      active: 112,
      suspended: 9,
      terminated: 7,
      ampereCount: 74,
      kilowattCount: 54,
    ),
    invoices: InvoiceOverviewResponse(
      unpaidCount: 12,
      unpaidTotal: 1800,
      partiallyPaidCount: 6,
      partiallyPaidTotal: 900,
      paidCount: 48,
      paidTotal: 7100,
    ),
    expensesByType: ExpensesByTypeResponse(
      fuel: 1200,
      maintenance: 850,
      employees: 650,
      other: 500,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
        highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
      ),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatGrid(summary: _mockSummary),
            SizedBox(height: context.spaceMedium),
            const RevenueChart(summary: _mockSummary),
            SizedBox(height: context.spaceMedium),
            InvoiceOverviewList(invoices: _mockSummary.invoices),
            SizedBox(height: context.spaceMedium),
            CustomerExpensesOverview(
              customers: _mockSummary.customers,
              expensesByType: _mockSummary.expensesByType,
              totalExpensesAllTime: _mockSummary.totalExpensesAllTime,
            ),
          ],
        ),
      ),
    );
  }
}
