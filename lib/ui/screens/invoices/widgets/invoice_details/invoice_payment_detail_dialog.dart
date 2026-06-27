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
      title: const Text('Payment Details'),
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
                  label: 'Amount',
                  value: '\$${payment.amount.toStringAsFixed(2)}',
                  accentColor: AppColors.success,
                ),
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.wallet,
                  label: 'Method',
                  value: payment.paymentMethod.label,
                  accentColor: colorScheme.primary,
                ),
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.calendar,
                  label: 'Payment date',
                  value: formatDate(payment.paymentDate),
                  accentColor: colorScheme.primary,
                ),
                if (notes != null && notes.isNotEmpty) ...[
                  SizedBox(height: context.spaceSmall),
                  const Divider(),
                  SizedBox(height: context.spaceSmall),
                  InvoiceDetailTile(
                    icon: LucideIcons.fileText,
                    label: 'Notes',
                    value: notes,
                    accentColor: colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ],
                SizedBox(height: context.spaceSmall),
                const Divider(),
                SizedBox(height: context.spaceSmall),
                InvoiceDetailTile(
                  icon: LucideIcons.clock,
                  label: 'Created',
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
          child: const Text('Close'),
        ),
      ],
    );
  }
}
