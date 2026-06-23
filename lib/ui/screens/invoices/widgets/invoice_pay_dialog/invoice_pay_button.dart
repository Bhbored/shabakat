import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import 'invoice_pay_dialog.dart';

class InvoicePayButton extends StatelessWidget {
  final String invoiceId;
  final double amountDue;

  const InvoicePayButton({
    super.key,
    required this.invoiceId,
    required this.amountDue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => showInvoicePayDialog(
            context: context,
            invoiceId: invoiceId,
            amountDue: amountDue,
          ),
          child: Text(
            'Pay',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
