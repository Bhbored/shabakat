import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_card/invoice_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class InvoicesSkeleton extends StatelessWidget {
  const InvoicesSkeleton({super.key});

  static const _itemCount = 6;

  static final _mockInvoices = List.generate(
    _itemCount,
    (index) => Invoice(
      id: 'skeleton-$index',
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      companyId: 'company',
      customerId: 'customer',
      customerName: 'Customer Name',
      invoiceNumber: 1000 + index,
      issueDate: DateTime(2024, 6, 1),
      dueDate: DateTime(2024, 7, 1),
      fixedCharge: 10,
      tva: 2,
      totalAmount: 150,
      paidAmount: 50,
      amountDue: 100,
      invoiceStatus: InvoiceStatus.unpaid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _InvoicesToolbarSkeleton(),
            const _InvoiceFilterChipsSkeleton(),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
                itemCount: _mockInvoices.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: InvoiceCard(invoice: _mockInvoices[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvoicesToolbarSkeleton extends StatelessWidget {
  const _InvoicesToolbarSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        context.paddingMedium,
        context.paddingMedium,
        0,
      ),
      child: Text(
        'invoices.count'.tr(args: ['48']),
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

class _InvoiceFilterChipsSkeleton extends StatelessWidget {
  const _InvoiceFilterChipsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingSmall,
        context.spaceSmall,
      ),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            icon: const Icon(LucideIcons.slidersHorizontal),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
