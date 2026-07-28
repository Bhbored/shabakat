import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_amount_stat_card.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_breakdown.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_detail_meta_tile.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_detail_section.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_detail_tile.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_details_header.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_details/invoice_payment_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InvoiceDetailsSkeleton extends StatelessWidget {
  const InvoiceDetailsSkeleton({super.key});

  static final _mockInvoice = Invoice(
    id: 'skeleton',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 6, 15),
    companyId: 'company',
    customerId: 'customer',
    customerName: 'Customer Name',
    customerPhone: '+961 00 000 000',
    invoiceNumber: 1042,
    issueDate: DateTime(2024, 6, 1),
    dueDate: DateTime(2024, 7, 1),
    fixedCharge: 10,
    tva: 11,
    totalAmount: 150,
    paidAmount: 50,
    amountDue: 100,
    billedConsumption: 120,
    invoiceStatus: InvoiceStatus.partiallypaid,
    payments: [
      Payment(
        id: 'skeleton-payment',
        createdAt: DateTime(2024, 6, 10),
        updatedAt: DateTime(2024, 6, 10),
        companyId: 'company',
        customerId: 'customer',
        invoiceId: 'skeleton',
        amount: 50,
        paymentMethod: PaymentMethod.cash,
        paymentDate: DateTime(2024, 6, 10),
      ),
    ],
  );

  static String _formatDate(DateTime date) {
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
    final breakdown = InvoiceBreakdown.fromInvoice(_mockInvoice);

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InvoiceDetailsHeader(
                invoice: _mockInvoice,
                formatDate: _formatDate,
              ),
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
                            value: _mockInvoice.totalAmount,
                            icon: LucideIcons.receipt,
                            accentColor: colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: context.paddingSmall),
                        Expanded(
                          child: InvoiceAmountStatCard(
                            label: 'invoices.details.paid'.tr(),
                            value: _mockInvoice.paidAmount,
                            icon: LucideIcons.checkCircle2,
                            accentColor: AppColors.success,
                          ),
                        ),
                        SizedBox(width: context.paddingSmall),
                        Expanded(
                          child: InvoiceAmountStatCard(
                            label: 'invoices.details.due'.tr(),
                            value: _mockInvoice.amountDue,
                            icon: LucideIcons.alertCircle,
                            accentColor: AppColors.warning,
                            emphasize: true,
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
                            value: _formatDate(_mockInvoice.issueDate),
                            icon: LucideIcons.calendar,
                            accentColor: colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: context.paddingSmall),
                        Expanded(
                          child: InvoiceDetailMetaTile(
                            label: 'invoices.details.consumption_end'.tr(),
                            value: _formatDate(_mockInvoice.dueDate),
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
                          value:
                              '\$${breakdown.displayedCharge.toStringAsFixed(2)}',
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
                          label: 'invoices.details.tva_rate'.tr(
                            args: [breakdown.tvaRate.toStringAsFixed(0)],
                          ),
                          value: '\$${breakdown.tvaAmount.toStringAsFixed(2)}',
                          accentColor: AppColors.success,
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
                    InvoiceDetailSection(
                      title: 'invoices.details.billed_consumption'.tr(),
                      children: [
                        InvoiceDetailTile(
                          icon: LucideIcons.gauge,
                          label: 'invoices.details.consumption'.tr(),
                          value: 'invoices.details.consumption_value'.tr(
                            args: ['120.00'],
                          ),
                          accentColor: colorScheme.tertiary,
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
                    InvoiceDetailSection(
                      title: 'invoices.details.payments'.tr(),
                      children: [
                        InvoicePaymentTile(
                          payment: _mockInvoice.payments!.first,
                          formatDate: _formatDate,
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
                    Text('invoices.details.record'.tr(), style: mutedLabel),
                    SizedBox(height: context.spaceSmall),
                    Row(
                      children: [
                        Expanded(
                          child: InvoiceDetailMetaTile(
                            label: 'invoices.details.created'.tr(),
                            value: _formatDate(_mockInvoice.createdAt),
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
                            value: _formatDate(_mockInvoice.updatedAt),
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
      ),
    );
  }
}
