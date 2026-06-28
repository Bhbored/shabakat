import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_card/invoice_card.dart';

import 'subscriber_create_invoice_dialog.dart';

class SubscriberInvoicesSection extends ConsumerWidget {
  final String customerId;
  final String? customerName;
  final CustomerStatus customerStatus;
  final PlanType plan;

  const SubscriberInvoicesSection({
    super.key,
    required this.customerId,
    required this.customerStatus,
    required this.plan,
    this.customerName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final invoicesAsync = ref.watch(invoiceProvider);
    final pagination = ref.watch(invoicePaginationProvider);
    final filterNotifier = ref.read(invoiceFilterProvider.notifier);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'subscribers.invoices.title'.tr(),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (customerStatus == CustomerStatus.active)
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => showSubscriberCreateInvoiceDialog(
                      context: context,
                      customerId: customerId,
                      plan: plan,
                      customerName: customerName,
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: pagination.hasPreviousPage
                      ? filterNotifier.previousPage
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed:
                      pagination.hasNextPage ? filterNotifier.nextPage : null,
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            Divider(color: colorScheme.outline.withValues(alpha: 0.5)),
            SizedBox(height: context.spaceSmall),
            invoicesAsync.when(
              skipLoadingOnRefresh: true,
              loading: () => const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) {
                final message = err is ApiException
                    ? err.userMessage
                    : 'subscribers.invoices.load_failed'.tr();
                return Text(message, style: theme.textTheme.bodyMedium);
              },
              data: (invoices) {
                if (invoices.isEmpty) {
                  return Text(
                    'subscribers.invoices.empty'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  );
                }

                return Column(
                  children: [
                    for (var i = 0; i < invoices.length; i++) ...[
                      if (i > 0) SizedBox(height: context.spaceSmall),
                      InvoiceCard(invoice: invoices[i]),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
