import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/customer_overview_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/expenses_by_type_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/pending_badge.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/upcoming_due/send_reminders_button.dart';

String _formatMoney(double value) => '\$${value.toStringAsFixed(2)}';

class CustomerExpensesOverview extends StatelessWidget {
  final CustomerOverviewResponse customers;
  final ExpensesByTypeResponse expensesByType;
  final double totalExpensesAllTime;
  final VoidCallback? onSendReminders;

  const CustomerExpensesOverview({
    super.key,
    required this.customers,
    required this.expensesByType,
    required this.totalExpensesAllTime,
    this.onSendReminders,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customerRows = [
      _MetricRow('Active', customers.active, LucideIcons.userCheck, AppColors.success),
      _MetricRow('Suspended', customers.suspended, LucideIcons.userX, AppColors.warning),
      _MetricRow('Terminated', customers.terminated, LucideIcons.userMinus, AppColors.error),
      _MetricRow('Ampere', customers.ampereCount, LucideIcons.zap, colorScheme.primary),
      _MetricRow('Kilowatt', customers.kilowattCount, LucideIcons.gauge, colorScheme.tertiary),
    ];
    final expenseRows = [
      _ExpenseRow('Fuel', expensesByType.fuel),
      _ExpenseRow('Maintenance', expensesByType.maintenance),
      _ExpenseRow('Employees', expensesByType.employees),
      _ExpenseRow('Other', expensesByType.other),
    ];

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
                  'Customers & Expenses',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PendingBadge(
                  count: customers.suspended + customers.terminated,
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            Text(
              'CUSTOMERS',
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: context.spaceSmall),
            for (var i = 0; i < customerRows.length; i++)
              _CustomerMetricRow(
                data: customerRows[i],
                isLast: i == customerRows.length - 1,
              ),
            SizedBox(height: context.spaceMedium),
            Text(
              'EXPENSES · ${_formatMoney(totalExpensesAllTime)}',
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: context.spaceSmall),
            for (var i = 0; i < expenseRows.length; i++)
              _ExpenseTypeRow(
                data: expenseRows[i],
                total: totalExpensesAllTime,
                isLast: i == expenseRows.length - 1,
              ),
            SizedBox(height: context.spaceMedium),
            SendRemindersButton(onPressed: onSendReminders),
          ],
        ),
      ),
    );
  }
}

class _MetricRow {
  final String label;
  final int value;
  final IconData icon;
  final Color color;

  const _MetricRow(this.label, this.value, this.icon, this.color);
}

class _ExpenseRow {
  final String label;
  final double amount;

  const _ExpenseRow(this.label, this.amount);
}

class _CustomerMetricRow extends StatelessWidget {
  final _MetricRow data;
  final bool isLast;

  const _CustomerMetricRow({required this.data, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: context.spaceSmall * 0.75),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: colorScheme.outline)),
      ),
      child: Row(
        children: [
          Icon(data.icon, size: 16, color: data.color),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: Text(
              data.label,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            data.value.toString(),
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseTypeRow extends StatelessWidget {
  final _ExpenseRow data;
  final double total;
  final bool isLast;

  const _ExpenseTypeRow({
    required this.data,
    required this.total,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final fraction = total <= 0 ? 0.0 : data.amount / total;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : context.spaceSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.label, style: theme.textTheme.bodyMedium),
              Text(
                _formatMoney(data.amount),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall * 0.5),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 6,
              backgroundColor: colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
