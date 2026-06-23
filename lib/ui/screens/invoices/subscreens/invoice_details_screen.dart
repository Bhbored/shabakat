import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/invoice/single_invoice_provider.dart';

import '../widgets/invoice_delete_dialog/invoice_delete_dialog.dart';
import '../widgets/invoice_details/invoice_details_body.dart';
import '../widgets/invoice_details/invoice_details_scaffold.dart';
import '../widgets/invoice_edit_sheet/invoice_edit_sheet.dart';

class InvoiceDetailsScreen extends ConsumerWidget {
  final String invoiceId;

  const InvoiceDetailsScreen({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(singleInvoiceProvider(invoiceId));

    return detailAsync.when(
      loading: () => const InvoiceDetailsScaffold(
        title: 'Invoice',
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) {
        final message = err is ApiException
            ? err.userMessage
            : 'Failed to load invoice details.';
        return InvoiceDetailsScaffold(
          title: 'Invoice',
          body: Center(child: Text(message, textAlign: TextAlign.center)),
        );
      },
      data: (invoice) => InvoiceDetailsScaffold(
        title: 'Invoice #${invoice.invoiceNumber}',
        onEdit: () => InvoiceEditSheet.show(
          context,
          invoiceId: invoiceId,
          invoice: invoice,
        ),
        onDelete: () => showInvoiceDeleteDialog(
          context: context,
          invoiceId: invoiceId,
          invoiceNumber: invoice.invoiceNumber,
        ),
        body: InvoiceDetailsBody(
          invoice: invoice,
          onRefresh: () =>
              ref.read(singleInvoiceProvider(invoiceId).notifier).refresh(),
        ),
      ),
    );
  }
}
