import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/data/providers/dashboard/dashboard_provider.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/dashboard_skeleton.dart';

import 'widgets/recent_payments/recent_payments_list.dart';
import 'widgets/revenue_chart/revenue_chart.dart';
import 'widgets/stat_grid/stat_grid.dart';
import 'widgets/upcoming_due/upcoming_due_list.dart';

class DashboardScreen extends ConsumerWidget {
  final VoidCallback? onViewInvoices;

  const DashboardScreen({super.key, this.onViewInvoices});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardProvider);

    return summaryAsync.when(
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      loading: () => const DashboardSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'dashboard.load_error'.tr(),
        onTryAgain: () => ref.read(dashboardProvider.notifier).refresh(),
      ),
      data: (summary) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardProvider);
        },
        child: _DashboardBody(summary: summary, onViewInvoices: onViewInvoices),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  final DashboardSummaryResponse summary;
  final VoidCallback? onViewInvoices;

  const _DashboardBody({required this.summary, this.onViewInvoices});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatGrid(summary: summary),
          SizedBox(height: context.spaceMedium),
          RevenueChart(summary: summary),
          SizedBox(height: context.spaceMedium),
          InvoiceOverviewList(
            invoices: summary.invoices,
            onViewAll: onViewInvoices,
          ),
          SizedBox(height: context.spaceMedium),
          CustomerExpensesOverview(
            customers: summary.customers,
            expensesByType: summary.expensesByType,
            totalExpensesAllTime: summary.totalExpensesAllTime,
          ),
        ],
      ),
    );
  }
}
