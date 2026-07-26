import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_skipped_response.dart';
import 'package:shabakat/ui/screens/invoices/widgets/bulk_create/bulk_create_skipped_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BulkCreateSkippedSkeleton extends StatelessWidget {
  const BulkCreateSkippedSkeleton({super.key});

  static const _itemCount = 5;

  static final List<InvoiceSkippedResponse> mockItems = List.generate(
    _itemCount,
    (index) => InvoiceSkippedResponse(
      customerId: 'skeleton-$index',
      customerName: 'Customer Name',
      reason: 'Invoice already exists for this billing period',
      skippedAt: DateTime(2024, 6, 15, 14, 30),
    ),
  );

  static ShimmerEffect shimmerEffect(ColorScheme colorScheme) => ShimmerEffect(
    baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
    highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: shimmerEffect(colorScheme),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(context.paddingMedium),
          itemCount: mockItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: context.spaceSmall),
              child: BulkCreateSkippedCard(item: mockItems[index]),
            );
          },
        ),
      ),
    );
  }
}
