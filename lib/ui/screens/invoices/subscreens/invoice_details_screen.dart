import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/core/utilities/invoice_pdf_exporter.dart';
import 'package:shabakat/core/utilities/whatsapp_share_service.dart';
import 'package:shabakat/data/providers/invoice/single_invoice_provider.dart';

import '../widgets/invoice_delete_dialog/invoice_delete_dialog.dart';
import '../widgets/invoice_details/invoice_details_body.dart';
import '../widgets/invoice_details/invoice_details_scaffold.dart';
import '../widgets/invoice_edit_sheet/invoice_edit_sheet.dart';
import '../widgets/invoice_pay_dialog/invoice_pay_button.dart';

class InvoiceDetailsScreen extends ConsumerStatefulWidget {
  final String invoiceId;
  final bool readOnly;

  const InvoiceDetailsScreen({
    super.key,
    required this.invoiceId,
    this.readOnly = false,
  });

  @override
  ConsumerState<InvoiceDetailsScreen> createState() =>
      _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends ConsumerState<InvoiceDetailsScreen> {
  bool _isSharing = false;
  bool _isWhatsAppSharing = false;

  Future<List<int>> _loadInvoicePdfBytes() async {
    return ref.read(invoiceServiceProvider).printInvoicePdf(widget.invoiceId);
  }

  Future<void> _shareInvoice(String customerName) async {
    if (_isSharing || _isWhatsAppSharing) return;

    setState(() => _isSharing = true);

    try {
      final pdfBytes = await _loadInvoicePdfBytes();
      if (!mounted) return;

      await ref
          .read(invoicePdfExporterProvider)
          .shareInvoicePdf(
            context: context,
            pdfBytes: pdfBytes,
            customerName: customerName,
          );
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }

  Future<void> _shareInvoiceToWhatsApp({
    required String customerName,
    required String phoneNumber,
  }) async {
    if (_isSharing || _isWhatsAppSharing) return;

    setState(() => _isWhatsAppSharing = true);

    try {
      final pdfBytes = await _loadInvoicePdfBytes();
      if (!mounted) return;

      await ref
          .read(whatsAppShareServiceProvider)
          .shareInvoiceToWhatsApp(
            context: context,
            pdfBytes: pdfBytes,
            customerName: customerName,
            phoneNumber: phoneNumber,
          );
    } finally {
      if (mounted) {
        setState(() => _isWhatsAppSharing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(singleInvoiceProvider(widget.invoiceId));

    return detailAsync.when(
      loading: () => InvoiceDetailsScaffold(
        title: 'invoices.details.title'.tr(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) {
        final message = err is ApiException
            ? err.userMessage
            : 'invoices.load_details_failed'.tr();
        return InvoiceDetailsScaffold(
          title: 'invoices.details.title'.tr(),
          body: Center(child: Text(message, textAlign: TextAlign.center)),
        );
      },
      data: (invoice) {
        final isUnpaid = invoice.invoiceStatus == InvoiceStatus.unpaid;
        final customerName =
            invoice.customerName ?? invoice.invoiceNumber.toString();

        return InvoiceDetailsScaffold(
          title: 'invoices.details.title_number'.tr(
            args: [invoice.invoiceNumber.toString()],
          ),
          isShareLoading: _isSharing,
          isWhatsAppShareLoading: _isWhatsAppSharing,
          onWhatsAppShare: widget.readOnly
              ? null
              : () => _shareInvoiceToWhatsApp(
                  customerName: customerName,
                  phoneNumber: invoice.customerPhone ?? '',
                ),
          onShare: widget.readOnly ? null : () => _shareInvoice(customerName),
          onEdit: !widget.readOnly && isUnpaid
              ? () => InvoiceEditSheet.show(
                  context,
                  invoiceId: widget.invoiceId,
                  invoice: invoice,
                )
              : null,
          onDelete: !widget.readOnly && isUnpaid
              ? () => showInvoiceDeleteDialog(
                  context: context,
                  invoiceId: widget.invoiceId,
                  invoiceNumber: invoice.invoiceNumber,
                )
              : null,
          body: Column(
            children: [
              Expanded(
                child: InvoiceDetailsBody(
                  invoice: invoice,
                  onRefresh: () => ref
                      .read(singleInvoiceProvider(widget.invoiceId).notifier)
                      .refresh(),
                ),
              ),
              if (!widget.readOnly && invoice.amountDue > 0) ...[
                InvoicePayButton(
                  invoiceId: widget.invoiceId,
                  amountDue: invoice.amountDue,
                ),
                SizedBox(height: context.spaceMedium),
              ],
            ],
          ),
        );
      },
    );
  }
}
