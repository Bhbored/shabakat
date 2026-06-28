import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';

import 'invoice_amount_stat_card.dart';
import 'invoice_breakdown.dart';
import 'invoice_detail_meta_tile.dart';
import 'invoice_detail_section.dart';
import 'invoice_detail_tile.dart';
import 'invoice_details_header.dart';
import 'invoice_payment_tile.dart';

class InvoiceDetailsBody extends StatelessWidget {
  final Invoice invoice;
  final Future<void> Function() onRefresh;

  const InvoiceDetailsBody({
    super.key,
    required this.invoice,
    required this.onRefresh,
  });

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mutedLabel = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
      color: colorScheme.onSurface.withValues(alpha: 0.5),
    );
    final breakdown = InvoiceBreakdown.fromInvoice(invoice);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceDetailsHeader(invoice: invoice, formatDate: _formatDate),
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InvoiceAmountStatCard(
                          label: 'Total',
                          value: invoice.totalAmount,
                          icon: LucideIcons.receipt,
                          accentColor: colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceAmountStatCard(
                          label: 'Paid',
                          value: invoice.paidAmount,
                          icon: LucideIcons.checkCircle2,
                          accentColor: AppColors.success,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceAmountStatCard(
                          label: 'Due',
                          value: invoice.amountDue,
                          icon: LucideIcons.alertCircle,
                          accentColor: invoice.amountDue > 0
                              ? AppColors.warning
                              : AppColors.success,
                          emphasize: invoice.amountDue > 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaceMedium),
                  Text('TIMELINE', style: mutedLabel),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'Issued',
                          value: _formatDate(invoice.issueDate),
                          icon: LucideIcons.calendar,
                          accentColor: colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'Due',
                          value: _formatDate(invoice.dueDate),
                          icon: LucideIcons.calendarClock,
                          accentColor: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaceMedium),
                  InvoiceDetailSection(
                    title: 'BREAKDOWN',
                    children: [
                      InvoiceDetailTile(
                        icon: LucideIcons.zap,
                        label: 'Charge',
                        value: '\$${breakdown.charge.toStringAsFixed(2)}',
                        accentColor: colorScheme.primary,
                      ),

                      SizedBox(height: context.spaceSmall),
                      const Divider(),
                      SizedBox(height: context.spaceSmall),

                      InvoiceDetailTile(
                        icon: LucideIcons.badgeDollarSign,
                        label: 'Fixed charge',
                        value: '\$${breakdown.fixedCharge.toStringAsFixed(2)}',
                        accentColor: colorScheme.primary,
                      ),
                      SizedBox(height: context.spaceSmall),
                      const Divider(),
                      SizedBox(height: context.spaceSmall),

                      InvoiceDetailTile(
                        icon: LucideIcons.percent,
                        label: breakdown.tvaRate > 0
                            ? 'TVA (${breakdown.tvaRate.toStringAsFixed(0)}%)'
                            : 'TVA',
                        value: '\$${breakdown.tvaAmount.toStringAsFixed(2)}',
                        accentColor: AppColors.success,
                      ),
                    ],
                  ),
                  invoice.billedConsumption == null
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.spaceMedium),
                            InvoiceDetailSection(
                              title: 'BILLED CONSUMPTION',
                              children: [
                                InvoiceDetailTile(
                                  icon: LucideIcons.gauge,
                                  label: 'Consumption',
                                  value:
                                      '${invoice.billedConsumption!.toStringAsFixed(2)} kWh',
                                  accentColor: colorScheme.tertiary,
                                ),
                              ],
                            ),
                          ],
                        ),
                  if (invoice.payments != null &&
                      invoice.payments!.isNotEmpty) ...[
                    SizedBox(height: context.spaceMedium),
                    InvoiceDetailSection(
                      title: 'PAYMENTS',
                      children: [
                        for (var i = 0; i < invoice.payments!.length; i++) ...[
                          if (i > 0) SizedBox(height: context.spaceSmall),
                          InvoicePaymentTile(
                            payment: invoice.payments![i],
                            formatDate: _formatDate,
                          ),
                        ],
                      ],
                    ),
                  ],
                  SizedBox(height: context.spaceMedium),
                  Text('RECORD', style: mutedLabel),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'Created',
                          value: _formatDate(invoice.createdAt),
                          icon: LucideIcons.clock,
                          accentColor: colorScheme.onSurface.withValues(
                            alpha: 0.55,
                          ),
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'Updated',
                          value: _formatDate(invoice.updatedAt),
                          icon: LucideIcons.refreshCw,
                          accentColor: colorScheme.onSurface.withValues(
                            alpha: 0.55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
