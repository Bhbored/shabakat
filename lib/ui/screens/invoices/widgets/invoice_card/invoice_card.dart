import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/invoice_details_screen.dart';
import 'invoice_status_badge.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;

  const InvoiceCard({super.key, required this.invoice});

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customerName = invoice.customerName?.trim();

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            openInnerScreen(
              widget: InvoiceDetailsScreen(invoiceId: invoice.id),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '#${invoice.invoiceNumber}',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (customerName != null && customerName.isNotEmpty) ...[
                          SizedBox(height: context.spaceSmall * 0.5),
                          Text(
                            customerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: context.paddingSmall),
                  InvoiceStatusBadge(status: invoice.invoiceStatus),
                ],
              ),
              SizedBox(height: context.spaceSmall),
              Row(
                children: [
                  Expanded(
                    child: _MetaLine(
                      icon: LucideIcons.calendar,
                      label: 'Issued',
                      value: _formatDate(invoice.issueDate),
                    ),
                  ),
                  Expanded(
                    child: _MetaLine(
                      icon: LucideIcons.calendarClock,
                      label: 'Due',
                      value: _formatDate(invoice.dueDate),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.spaceSmall),
              const Divider(),
              SizedBox(height: context.spaceSmall),
              Row(
                children: [
                  Expanded(
                    child: _AmountLine(
                      label: 'Total',
                      value: invoice.totalAmount,
                    ),
                  ),
                  Expanded(
                    child: _AmountLine(
                      label: 'Due',
                      value: invoice.amountDue,
                      emphasize: invoice.amountDue > 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaLine extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MetaLine({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: colorScheme.onSurface.withValues(alpha: 0.45),
        ),
        SizedBox(width: context.spaceSmall * 0.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              Text(
                value,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AmountLine extends StatelessWidget {
  final String label;
  final double value;
  final bool emphasize;

  const _AmountLine({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: emphasize ? colorScheme.primary : null,
          ),
        ),
      ],
    );
  }
}
