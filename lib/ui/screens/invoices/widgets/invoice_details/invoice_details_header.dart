import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';

import '../invoice_card/invoice_status_badge.dart';

class InvoiceDetailsHeader extends StatelessWidget {
  final Invoice invoice;
  final String Function(DateTime) formatDate;

  const InvoiceDetailsHeader({
    super.key,
    required this.invoice,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor = InvoiceStatusBadge.colorFor(
      invoice.invoiceStatus,
      colorScheme,
    );
    final customerName = invoice.customerName?.trim();
    final hasCustomer = customerName != null && customerName.isNotEmpty;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withValues(alpha: 0.14),
            colorScheme.surface,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
      ),
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InvoiceStatusBadge(status: invoice.invoiceStatus),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(context.paddingSmall),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                ),
                child: Icon(
                  InvoiceStatusBadge.iconFor(invoice.invoiceStatus),
                  size: 22,
                  color: statusColor,
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceMedium),
          Text(
            '\$${invoice.amountDue.toStringAsFixed(2)}',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
              color: invoice.amountDue > 0
                  ? colorScheme.primary
                  : AppColors.success,
              height: 1,
            ),
          ),
          Text(
            'amount due',
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.55),
              letterSpacing: 0.6,
            ),
          ),
          if (hasCustomer) ...[
            SizedBox(height: context.spaceSmall),
            Row(
              children: [
                Icon(
                  LucideIcons.user,
                  size: 16,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                SizedBox(width: context.spaceSmall * 0.5),
                Expanded(
                  child: Text(
                    customerName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: context.spaceSmall),
          Row(
            children: [
              Icon(
                LucideIcons.fileText,
                size: 15,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              SizedBox(width: context.spaceSmall * 0.5),
              Text(
                '#${invoice.invoiceNumber}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaceSmall * 0.5,
                ),
                child: Text(
                  '·',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ),
              Icon(
                LucideIcons.calendarRange,
                size: 15,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              SizedBox(width: context.spaceSmall * 0.35),
              Text(
                '${formatDate(invoice.issueDate)} – ${formatDate(invoice.dueDate)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.65),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
