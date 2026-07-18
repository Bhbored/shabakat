import 'package:easy_localization/easy_localization.dart';
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
                          label: 'invoices.details.total'.tr(),
                          value: invoice.totalAmount,
                          icon: LucideIcons.receipt,
                          accentColor: colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceAmountStatCard(
                          label: 'invoices.details.paid'.tr(),
                          value: invoice.paidAmount,
                          icon: LucideIcons.checkCircle2,
                          accentColor: AppColors.success,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceAmountStatCard(
                          label: 'invoices.details.due'.tr(),
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
                  Text(
                    'invoices.details.consumption_period'.tr(),
                    style: mutedLabel,
                  ),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'invoices.details.consumption_start'.tr(),
                          value: _formatDate(invoice.issueDate),
                          icon: LucideIcons.calendar,
                          accentColor: colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'invoices.details.consumption_end'.tr(),
                          value: _formatDate(invoice.dueDate),
                          icon: LucideIcons.calendarClock,
                          accentColor: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaceMedium),
                  InvoiceDetailSection(
                    title: 'invoices.details.breakdown'.tr(),
                    children: [
                      InvoiceDetailTile(
                        icon: LucideIcons.zap,
                        label: 'invoices.details.charge'.tr(),
                        value: '\$${breakdown.charge.toStringAsFixed(2)}',
                        accentColor: colorScheme.primary,
                      ),
                      SizedBox(height: context.spaceSmall),
                      const Divider(),
                      SizedBox(height: context.spaceSmall),
                      InvoiceDetailTile(
                        icon: LucideIcons.badgeDollarSign,
                        label: 'invoices.details.fixed_charge'.tr(),
                        value: '\$${breakdown.fixedCharge.toStringAsFixed(2)}',
                        accentColor: colorScheme.primary,
                      ),
                      SizedBox(height: context.spaceSmall),
                      const Divider(),
                      SizedBox(height: context.spaceSmall),
                      InvoiceDetailTile(
                        icon: LucideIcons.percent,
                        label: breakdown.tvaRate > 0
                            ? 'invoices.details.tva_rate'.tr(
                                args: [breakdown.tvaRate.toStringAsFixed(0)],
                              )
                            : 'invoices.details.tva'.tr(),
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
                              title: 'invoices.details.billed_consumption'.tr(),
                              children: [
                                InvoiceDetailTile(
                                  icon: LucideIcons.gauge,
                                  label: 'invoices.details.consumption'.tr(),
                                  value: 'invoices.details.consumption_value'
                                      .tr(
                                    args: [
                                      invoice.billedConsumption!
                                          .toStringAsFixed(2),
                                    ],
                                  ),
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
                      title: 'invoices.details.payments'.tr(),
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
                  Text('invoices.details.record'.tr(), style: mutedLabel),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      Expanded(
                        child: InvoiceDetailMetaTile(
                          label: 'invoices.details.created'.tr(),
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
                          label: 'invoices.details.updated'.tr(),
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
