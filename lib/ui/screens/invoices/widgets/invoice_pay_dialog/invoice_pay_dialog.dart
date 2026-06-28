import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/core/utilities/decimal_amount.dart';
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
      text: formatDecimalAmount(widget.amountDue),
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
    if (value == null || value.trim().isEmpty) {
      return 'invoices.pay.validation.amount_required'.tr();
    }
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'settings.validation.invalid_number'.tr();
    if (amount <= 0) {
      return 'subscribers.invoices.validation.amount_positive'.tr();
    }
    if (amountExceedsDue(amount, widget.amountDue)) {
      return 'invoices.pay.validation.amount_exceeds'.tr(
        args: ['\$${formatDecimalAmount(widget.amountDue)}'],
      );
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
          message: 'invoices.pay.success'.tr(),
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'invoices.pay.failed'.tr();
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
      title: Text('invoices.pay.title'.tr()),
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
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: isProcessing ? null : _onProcess,
          child: isProcessing
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('invoices.pay.process'.tr()),
        ),
      ],
    );
  }
}
