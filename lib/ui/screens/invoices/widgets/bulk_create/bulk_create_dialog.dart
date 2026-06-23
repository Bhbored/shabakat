import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'bulk_create_confirm_content.dart';
import 'bulk_create_error_content.dart';
import 'bulk_create_success_content.dart';

enum _BulkCreateStep { confirm, success, error }

class BulkCreateInvoicesDialog extends ConsumerStatefulWidget {
  const BulkCreateInvoicesDialog({super.key});

  @override
  ConsumerState<BulkCreateInvoicesDialog> createState() =>
      _BulkCreateInvoicesDialogState();
}

class _BulkCreateInvoicesDialogState
    extends ConsumerState<BulkCreateInvoicesDialog> {
  _BulkCreateStep _step = _BulkCreateStep.confirm;
  BulkCreateInvoiceResponse? _response;
  String? _errorMessage;

  Future<void> _onProceed() async {
    try {
      final response = await ref.read(invoiceProvider.notifier).bulkCreate();
      if (!mounted) return;
      setState(() {
        _response = response;
        _step = _BulkCreateStep.success;
      });
      AppSnackBar.show(
        context,
        message: '${response.created} invoices created successfully.',
        variant: AppSnackBarVariant.success,
      );
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Bulk invoice creation failed. Please try again.';
      setState(() {
        _errorMessage = message;
        _step = _BulkCreateStep.error;
      });
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLoading = ref.watch(invoiceProvider).isLoading;

    return AlertDialog(
      title: Row(
        children: [
          Icon(LucideIcons.layers, color: colorScheme.primary, size: 22),
          SizedBox(width: context.spaceSmall),
          const Expanded(child: Text('Bulk Generate Invoices')),
        ],
      ),
      content: switch (_step) {
        _BulkCreateStep.confirm => const BulkCreateConfirmContent(),
        _BulkCreateStep.success => BulkCreateSuccessContent(
          response: _response!,
        ),
        _BulkCreateStep.error => BulkCreateErrorContent(
          message: _errorMessage!,
        ),
      },
      actions: switch (_step) {
        _BulkCreateStep.confirm => [
          TextButton(
            onPressed: isLoading ? null : () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: isLoading ? null : _onProceed,
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Proceed'),
          ),
        ],
        _BulkCreateStep.success => [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Done'),
          ),
        ],
        _BulkCreateStep.error => [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              _step = _BulkCreateStep.confirm;
              _errorMessage = null;
            }),
            child: const Text('Try Again'),
          ),
        ],
      },
    );
  }
}
