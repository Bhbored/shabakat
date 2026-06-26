import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';

import '../widgets/subscriber_delete_dialog/subscriber_delete_dialog.dart';

import '../widgets/subscriber_details/subscriber_details_body.dart';

import '../widgets/subscriber_edit_sheet/subscriber_edit_sheet.dart';

class SubscriberDetailsScreen extends ConsumerStatefulWidget {
  final String customerId;

  const SubscriberDetailsScreen({super.key, required this.customerId});

  @override
  ConsumerState<SubscriberDetailsScreen> createState() =>
      _SubscriberDetailsScreenState();
}

class _SubscriberDetailsScreenState
    extends ConsumerState<SubscriberDetailsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(invoiceFilterProvider.notifier)
          .updateFilter(
            const InvoiceFilterRequest().copyWith(
              customerId: widget.customerId,

              pageSize: 3,

              pageNumber: 1,
            ),
          );
    });
  }

  void _clearFilterAndPop() {
    ref.read(invoiceFilterProvider.notifier).clearFilter();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final detailAsync = ref.watch(singleCustomerProvider(widget.customerId));

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          ref.read(invoiceFilterProvider.notifier).clearFilter();
        }
      },

      child: detailAsync.when(
        loading: () => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),

              onPressed: _clearFilterAndPop,
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

                onPressed: _clearFilterAndPop,
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

              onPressed: _clearFilterAndPop,
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

                  customerId: widget.customerId,

                  customer: customer,
                ),
              ),

              IconButton(
                icon: const Icon(Icons.delete_outline),

                onPressed: () => showSubscriberDeleteDialog(
                  context: context,

                  customerId: widget.customerId,

                  customerName: customer.name,
                ),
              ),
            ],
          ),

          body: RefreshIndicator(
            onRefresh: () async {
              await ref
                  .read(singleCustomerProvider(widget.customerId).notifier)
                  .refresh();
              final customer =
                  ref.read(singleCustomerProvider(widget.customerId)).value;
              if (customer?.plan == PlanType.kilowatt) {
                await ref
                    .read(meterReadingProvider(widget.customerId).notifier)
                    .refresh();
              }
            },

            child: SubscriberDetailsBody(customer: customer),
          ),
        ),
      ),
    );
  }
}
