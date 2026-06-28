import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/payment_method.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';

import 'invoice_detail_tile.dart';

Future<void> showInvoicePaymentDetailDialog({
  required BuildContext context,
  required Payment payment,
  required String Function(DateTime) formatDate,
}) {
  return showDialog<void>(
    context: context,
    builder: (_) =>
        InvoicePaymentDetailDialog(payment: payment, formatDate: formatDate),
  );
}

class InvoicePaymentDetailDialog extends StatelessWidget {
  final Payment payment;
  final String Function(DateTime) formatDate;

  const InvoicePaymentDetailDialog({
    super.key,
    required this.payment,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final notes = payment.notes?.trim();

    return AlertDialog(
      title: Text('invoices.payment_details.title'.tr()),
      content: SizedBox(
        width: double.maxFinite,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.55,
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InvoiceDetailTile(
                  icon: LucideIcons.banknote,
                  label: 'invoices.payment_details.amount'.tr(),
                  value: '\$${payment.amount.toStringAsFixed(2)}',
                  accentColor: AppColors.success,
                ),
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.wallet,
                  label: 'invoices.payment_details.method'.tr(),
                  value: payment.paymentMethod.label,
                  accentColor: colorScheme.primary,
                ),
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.calendar,
                  label: 'invoices.payment_details.payment_date'.tr(),
                  value: formatDate(payment.paymentDate),
                  accentColor: colorScheme.primary,
                ),
                if (notes != null && notes.isNotEmpty) ...[
                  SizedBox(height: context.spaceSmall),
                  const Divider(),
                  SizedBox(height: context.spaceSmall),
                  InvoiceDetailTile(
                    icon: LucideIcons.fileText,
                    label: 'invoices.payment_details.notes'.tr(),
                    value: notes,
                    accentColor: colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ],
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.clock,
                  label: 'invoices.payment_details.created'.tr(),
                  value: formatDate(payment.createdAt),
                  accentColor: colorScheme.onSurface.withValues(alpha: 0.55),
                ),
                SizedBox(height: context.spaceSmall),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('invoices.payment_details.close'.tr()),
        ),
      ],
    );
  }
}
