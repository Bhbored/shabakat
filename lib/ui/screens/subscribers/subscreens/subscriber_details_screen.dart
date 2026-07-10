import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/data/providers/meter/meter_reading_provider.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';

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

  AppBar _appBar(ThemeData theme, {List<Widget>? actions}) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: _clearFilterAndPop,
      ),
      title: Text(
        'subscribers.details.title'.tr(),
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      ref.read(singleCustomerProvider(widget.customerId).notifier).refresh(),
      ref.read(invoiceProvider.notifier).refresh(),
    ]);
    final customer = ref.read(singleCustomerProvider(widget.customerId)).value;
    if (customer?.plan != PlanType.ampere) {
      await ref
          .read(meterReadingProvider(widget.customerId).notifier)
          .refresh();
    }
  }

  bool _canDeleteCustomer(
    Customer customer,
    AsyncValue<List<Invoice>> invoicesAsync,
    InvoicePagination pagination,
  ) {
    if (pagination.totalCount == 0) return true;

    return invoicesAsync.maybeWhen(
      data: (invoices) {
        if (invoices.any((i) => i.invoiceStatus != InvoiceStatus.unpaid)) {
          return false;
        }
        if (invoices.length >= pagination.totalCount) return true;
        return (customer.totalPaid ?? 0) == 0;
      },
      orElse: () => (customer.totalPaid ?? 0) == 0,
    );
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
          appBar: _appBar(theme),
          body: const Center(child: CircularProgressIndicator()),
        ),
        error: (err, _) {
          final message = err is ApiException
              ? err.userMessage
              : 'subscribers.details.load_failed'.tr();

          return Scaffold(
            appBar: _appBar(theme),
            body: Center(child: Text(message, textAlign: TextAlign.center)),
          );
        },
        data: (customer) {
          final invoicesAsync = ref.watch(invoiceProvider);
          final pagination = ref.watch(invoicePaginationProvider);
          final canDelete = _canDeleteCustomer(
            customer,
            invoicesAsync,
            pagination,
          );

          return Scaffold(
            appBar: _appBar(
              theme,
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () => SubscriberEditSheet.show(
                    context,
                    customerId: widget.customerId,
                    customer: customer,
                  ),
                ),
                if (canDelete)
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
              onRefresh: _onRefresh,
              child: SubscriberDetailsBody(customer: customer),
            ),
          );
        },
      ),
    );
  }
}
