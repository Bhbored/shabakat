import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_pay_dialog/invoice_pay_dialog_content.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showSubscriberCreateInvoiceDialog({
  required BuildContext context,
  required String customerId,
  required PlanType plan,
  String? customerName,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => SubscriberCreateInvoiceDialog(
      scaffoldContext: context,
      customerId: customerId,
      plan: plan,
      customerName: customerName,
    ),
  );
}

class SubscriberCreateInvoiceDialog extends ConsumerStatefulWidget {
  final BuildContext scaffoldContext;
  final String customerId;
  final PlanType plan;
  final String? customerName;

  const SubscriberCreateInvoiceDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerId,
    required this.plan,
    this.customerName,
  });

  bool get _isFixedKilowatt => plan == PlanType.fixedKilowatt;

  String get _targetLabel {
    final name = customerName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'this subscriber';
  }

  @override
  ConsumerState<SubscriberCreateInvoiceDialog> createState() =>
      _SubscriberCreateInvoiceDialogState();
}

class _SubscriberCreateInvoiceDialogState
    extends ConsumerState<SubscriberCreateInvoiceDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;
  PaymentMethod _paymentMethod = PaymentMethod.cash;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _amountValidator(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'Enter a valid number';
    if (amount <= 0) return 'Amount must be greater than 0';
    return null;
  }

  CreateInvoiceRequest _buildRequest() {
    final amountText = _amountController.text.trim();
    final notes = _notesController.text.trim();
    final paymentAmount = amountText.isEmpty ? null : double.parse(amountText);

    return CreateInvoiceRequest(
      customerId: widget.customerId,
      paymentAmount: paymentAmount,
      paymentMethod: paymentAmount != null ? _paymentMethod : null,
      notes: notes.isEmpty ? null : notes,
    );
  }

  Future<void> _onCreate() async {
    if (widget._isFixedKilowatt && !_formKey.currentState!.validate()) {
      return;
    }

    try {
      await ref
          .read(invoiceProvider.notifier)
          .createInvoice(
            widget._isFixedKilowatt
                ? _buildRequest()
                : CreateInvoiceRequest(customerId: widget.customerId),
          );

      if (!mounted) return;
      Navigator.of(context).pop();
      if (widget.scaffoldContext.mounted) {
        AppSnackBar.show(
          widget.scaffoldContext,
          message: 'Invoice created',
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to create invoice. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCreating = ref.watch(invoiceProvider).isLoading;

    return AlertDialog(
      title: const Text('Create Invoice'),
      content: SizedBox(
        width: double.maxFinite,
        child: widget._isFixedKilowatt
            ? _FixedKilowattContent(
                formKey: _formKey,
                targetLabel: widget._targetLabel,
                amountController: _amountController,
                notesController: _notesController,
                paymentMethod: _paymentMethod,
                enabled: !isCreating,
                amountValidator: _amountValidator,
                onPaymentMethodChanged: isCreating
                    ? (_) {}
                    : (value) {
                        if (value != null) {
                          setState(() => _paymentMethod = value);
                        }
                      },
              )
            : Text(
                'Create a new invoice for "${widget._targetLabel}"?',
                style: theme.textTheme.bodyMedium,
              ),
      ),
      actions: [
        TextButton(
          onPressed: isCreating ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isCreating ? null : _onCreate,
          child: isCreating
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Create'),
        ),
      ],
    );
  }
}

class _FixedKilowattContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String targetLabel;
  final TextEditingController amountController;
  final TextEditingController notesController;
  final PaymentMethod paymentMethod;
  final bool enabled;
  final String? Function(String?)? amountValidator;
  final ValueChanged<PaymentMethod?> onPaymentMethodChanged;

  const _FixedKilowattContent({
    required this.formKey,
    required this.targetLabel,
    required this.amountController,
    required this.notesController,
    required this.paymentMethod,
    required this.enabled,
    required this.amountValidator,
    required this.onPaymentMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create a new invoice for "$targetLabel".',
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        Text(
          'Payment (optional)',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.spaceSmall),
        InvoicePayDialogContent(
          formKey: formKey,
          amountController: amountController,
          notesController: notesController,
          paymentMethod: paymentMethod,
          enabled: enabled,
          amountValidator: amountValidator,
          onPaymentMethodChanged: onPaymentMethodChanged,
        ),
      ],
    );
  }
}
