import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';

import '../widgets/subscriber_delete_dialog/subscriber_delete_dialog.dart';
import '../widgets/subscriber_details/subscriber_details_body.dart';
import '../widgets/subscriber_edit_sheet/subscriber_edit_sheet.dart';

class SubscriberDetailsScreen extends ConsumerWidget {
  final String customerId;

  const SubscriberDetailsScreen({super.key, required this.customerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final detailAsync = ref.watch(singleCustomerProvider(customerId));

    return detailAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Subscriber Details',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) {
        final message = err is ApiException
            ? err.userMessage
            : 'Failed to load subscriber details.';
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Subscriber Details',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(child: Text(message, textAlign: TextAlign.center)),
        );
      },
      data: (customer) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Subscriber Details',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () => SubscriberEditSheet.show(
                context,
                customerId: customerId,
                customer: customer,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => showSubscriberDeleteDialog(
                context: context,
                customerId: customerId,
                customerName: customer.name,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              ref.read(singleCustomerProvider(customerId).notifier).refresh(),
          child: SubscriberDetailsBody(customer: customer),
        ),
      ),
    );
  }
}
