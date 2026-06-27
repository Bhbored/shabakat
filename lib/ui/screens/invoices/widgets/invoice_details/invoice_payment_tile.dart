import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/payment_method.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';

import 'invoice_payment_detail_dialog.dart';

class InvoicePaymentTile extends StatelessWidget {
  final Payment payment;
  final String Function(DateTime) formatDate;

  const InvoicePaymentTile({
    super.key,
    required this.payment,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: () => showInvoicePaymentDetailDialog(
        context: context,
        payment: payment,
        formatDate: formatDate,
      ),
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spaceSmall * 0.25),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(context.paddingSmall * 0.75),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              ),
              child: const Icon(
                LucideIcons.banknote,
                size: 16,
                color: AppColors.success,
              ),
            ),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.paymentMethod.label.toUpperCase(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: context.spaceSmall * 0.25),
                  Text(
                    formatDate(payment.paymentDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${payment.amount.toStringAsFixed(2)}',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: 'JetBrains Mono',
                color: AppColors.success,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
