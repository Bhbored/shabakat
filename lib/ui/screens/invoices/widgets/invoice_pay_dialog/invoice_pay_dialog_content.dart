import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_adding/expense_add_form_field.dart';

import 'invoice_pay_method_field.dart';

class InvoicePayDialogContent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController amountController;
  final TextEditingController notesController;
  final PaymentMethod paymentMethod;
  final bool enabled;
  final String? Function(String?)? amountValidator;
  final ValueChanged<PaymentMethod?> onPaymentMethodChanged;

  final String amountLabel;
  final bool showPaymentMethod;

  const InvoicePayDialogContent({
    super.key,
    required this.formKey,
    required this.amountController,
    required this.notesController,
    required this.paymentMethod,
    required this.enabled,
    required this.amountValidator,
    required this.onPaymentMethodChanged,
    this.amountLabel = 'Amount',
    this.showPaymentMethod = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpenseAddFormField(
            label: amountLabel,
            controller: amountController,
            hint: '0.00',
            enabled: enabled,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: amountValidator,
          ),
          if (showPaymentMethod) ...[
            SizedBox(height: context.spaceMedium),
            InvoicePayMethodField(
              value: paymentMethod,
              enabled: enabled,
              onChanged: onPaymentMethodChanged,
            ),
          ],
          SizedBox(height: context.spaceMedium),
          ExpenseAddFormField(
            label: 'Notes',
            controller: notesController,
            hint: 'Optional notes',
            enabled: enabled,
            maxLines: 3,
            maxLength: 500,
          ),
        ],
      ),
    );
  }
}
