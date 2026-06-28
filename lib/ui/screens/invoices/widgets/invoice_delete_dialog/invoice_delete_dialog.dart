import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showInvoiceDeleteDialog({
  required BuildContext context,
  required String invoiceId,
  required int invoiceNumber,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => InvoiceDeleteDialog(
      scaffoldContext: context,
      invoiceId: invoiceId,
      invoiceNumber: invoiceNumber,
    ),
  );
}

class InvoiceDeleteDialog extends ConsumerWidget {
  final BuildContext scaffoldContext;
  final String invoiceId;
  final int invoiceNumber;

  const InvoiceDeleteDialog({
    super.key,
    required this.scaffoldContext,
    required this.invoiceId,
    required this.invoiceNumber,
  });

  Future<void> _onDelete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(invoiceProvider.notifier).deleteInvoice(invoiceId);
      if (!context.mounted) return;
      AppSnackBar.show(
        scaffoldContext,
        message: 'invoices.delete.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
      if (scaffoldContext.mounted) {
        Navigator.of(scaffoldContext).pop();
      }
    } catch (e) {
      if (!context.mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'invoices.delete.failed'.tr();
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
    final isDeleting = ref.watch(invoiceProvider).isLoading;

    return AlertDialog(
      title: Text('invoices.delete.title'.tr()),
      content: Text(
        'invoices.delete.message'.tr(args: [invoiceNumber.toString()]),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : () => _onDelete(context, ref),
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('invoices.delete.confirm'.tr()),
        ),
      ],
    );
  }
}
