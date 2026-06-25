import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showSubscriberCreateInvoiceDialog({
  required BuildContext context,
  required String customerId,
  String? customerName,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => SubscriberCreateInvoiceDialog(
      scaffoldContext: context,
      customerId: customerId,
      customerName: customerName,
    ),
  );
}

class SubscriberCreateInvoiceDialog extends ConsumerWidget {
  final BuildContext scaffoldContext;
  final String customerId;
  final String? customerName;

  const SubscriberCreateInvoiceDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerId,
    this.customerName,
  });

  String get _targetLabel {
    final name = customerName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return 'this subscriber';
  }

  Future<void> _onCreate(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(invoiceProvider.notifier).createInvoice(
            CreateInvoiceRequest(customerId: customerId),
          );
      if (!context.mounted) return;
      Navigator.of(context).pop();
      if (scaffoldContext.mounted) {
        AppSnackBar.show(
          scaffoldContext,
          message: 'Invoice created',
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!context.mounted) return;
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
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isCreating = ref.watch(invoiceProvider).isLoading;

    return AlertDialog(
      title: const Text('Create Invoice'),
      content: Text(
        'Create a new invoice for "$_targetLabel"?',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isCreating ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isCreating ? null : () => _onCreate(context, ref),
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
