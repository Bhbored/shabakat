import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/invoice_overview_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';

String _formatMoney(double value) => '\$${value.toStringAsFixed(2)}';

class InvoiceOverviewList extends StatelessWidget {
  final InvoiceOverviewResponse invoices;
  final VoidCallback? onViewAll;

  const InvoiceOverviewList({
    super.key,
    required this.invoices,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final rows = [
      _InvoiceRowData(
        label: 'dashboard.invoice_overview.paid'.tr(),
        count: invoices.paidCount,
        total: invoices.paidTotal,
        icon: LucideIcons.checkCircle2,
        color: AppColors.success,
      ),
      _InvoiceRowData(
        label: 'dashboard.invoice_overview.partially_paid'.tr(),
        count: invoices.partiallyPaidCount,
        total: invoices.partiallyPaidTotal,
        icon: LucideIcons.circleDashed,
        color: AppColors.warning,
      ),
      _InvoiceRowData(
        label: 'dashboard.invoice_overview.unpaid'.tr(),
        count: invoices.unpaidCount,
        total: invoices.unpaidTotal,
        icon: LucideIcons.alertCircle,
        color: AppColors.error,
      ),
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
                  'dashboard.invoice_overview.title'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: onViewAll,
                  child: Text(
                    'dashboard.invoice_overview.view_all'.tr(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            for (var i = 0; i < rows.length; i++)
              _InvoiceOverviewRow(
                data: rows[i],
                isLast: i == rows.length - 1,
              ),
          ],
        ),
      ),
    );
  }
}

class _InvoiceRowData {
  final String label;
  final int count;
  final double total;
  final IconData icon;
  final Color color;

  const _InvoiceRowData({
    required this.label,
    required this.count,
    required this.total,
    required this.icon,
    required this.color,
  });
}

class _InvoiceOverviewRow extends StatelessWidget {
  final _InvoiceRowData data;
  final bool isLast;

  const _InvoiceOverviewRow({
    required this.data,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: context.spaceSmall),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: colorScheme.outline)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.paddingSmall * 0.75),
            decoration: BoxDecoration(
              color: data.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            ),
            child: Icon(data.icon, size: 16, color: data.color),
          ),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'dashboard.invoice_overview.invoice_count'.tr(
                    args: [data.count.toString()],
                  ),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatMoney(data.total),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: 'JetBrains Mono',
            ),
          ),
        ],
      ),
    );
  }
}
