import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/data/providers/invoice/single_invoice_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'invoice_pay_dialog_content.dart';

Future<void> showInvoicePayDialog({
  required BuildContext context,
  required String invoiceId,
  required double amountDue,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => InvoicePayDialog(
      scaffoldContext: context,
      invoiceId: invoiceId,
      amountDue: amountDue,
    ),
  );
}

class InvoicePayDialog extends ConsumerStatefulWidget {
  final BuildContext scaffoldContext;
  final String invoiceId;
  final double amountDue;

  const InvoicePayDialog({
    super.key,
    required this.scaffoldContext,
    required this.invoiceId,
    required this.amountDue,
  });

  @override
  ConsumerState<InvoicePayDialog> createState() => _InvoicePayDialogState();
}

class _InvoicePayDialogState extends ConsumerState<InvoicePayDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;
  PaymentMethod _paymentMethod = PaymentMethod.cash;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(
      text: widget.amountDue.toStringAsFixed(2),
    );
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _amountValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter amount';
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'Enter a valid number';
    if (amount <= 0) return 'Amount must be greater than 0';
    if (amount > widget.amountDue) {
      return 'Amount cannot exceed \$${widget.amountDue.toStringAsFixed(2)}';
    }
    return null;
  }

  Future<void> _onProcess() async {
    if (!_formKey.currentState!.validate()) return;

    final notes = _notesController.text.trim();
    final request = AddPaymentRequest(
      amount: double.parse(_amountController.text.trim()),
      paymentMethod: _paymentMethod,
      notes: notes.isEmpty ? null : notes,
    );

    try {
      await ref
          .read(invoiceProvider.notifier)
          .payInvoice(widget.invoiceId, request);
      await ref
          .read(singleInvoiceProvider(widget.invoiceId).notifier)
          .refresh();
      if (!mounted) return;
      Navigator.of(context).pop();
      if (widget.scaffoldContext.mounted) {
        AppSnackBar.show(
          widget.scaffoldContext,
          message: 'Payment recorded',
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to record payment. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isProcessing = ref.watch(invoiceProvider).isLoading;

    return AlertDialog(
      title: const Text('Pay Invoice'),
      content: SizedBox(
        width: double.maxFinite,
        child: InvoicePayDialogContent(
        formKey: _formKey,
        amountController: _amountController,
        notesController: _notesController,
        paymentMethod: _paymentMethod,
        enabled: !isProcessing,
        amountValidator: _amountValidator,
        onPaymentMethodChanged: isProcessing
            ? (_) {}
            : (value) {
                if (value != null) {
                  setState(() => _paymentMethod = value);
                }
              },
        ),
      ),
      actions: [
        TextButton(
          onPressed: isProcessing ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isProcessing ? null : _onProcess,
          child: isProcessing
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Process'),
        ),
      ],
    );
  }
}
