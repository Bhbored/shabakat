import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../../subscreens/bulk_create_skipped_screen.dart';
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
  bool _filterByPlan = false;
  PlanType _selectedPlan = PlanType.ampere;

  Future<void> _onProceed() async {
    try {
      final response = await ref
          .read(invoiceProvider.notifier)
          .bulkCreate(planType: _filterByPlan ? _selectedPlan : null);
      if (!mounted) return;
      setState(() {
        _response = response;
        _step = _BulkCreateStep.success;
      });
      AppSnackBar.show(
        context,
        message: 'invoices.bulk_create.success_snackbar'.tr(
          args: [response.created.toString()],
        ),
        variant: AppSnackBarVariant.success,
      );
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'invoices.bulk_create.failed'.tr();
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

    return AppAlertDialog(
      title: Row(
        children: [
          Icon(LucideIcons.layers, color: colorScheme.primary, size: 22),
          SizedBox(width: context.spaceSmall),
          Expanded(child: Text('invoices.bulk_create.title'.tr())),
        ],
      ),
      content: switch (_step) {
        _BulkCreateStep.confirm => BulkCreateConfirmContent(
          filterByPlan: _filterByPlan,
          selectedPlan: _selectedPlan,
          enabled: !isLoading,
          onFilterToggled: (value) => setState(() => _filterByPlan = value),
          onPlanChanged: (value) => setState(() => _selectedPlan = value),
        ),
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
            child: Text('settings.cancel'.tr()),
          ),
          ElevatedButton(
            onPressed: isLoading ? null : _onProceed,
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text('invoices.bulk_create.proceed'.tr()),
          ),
        ],
        _BulkCreateStep.success => [
          if (_response!.skipped > 0)
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  openInnerScreen(widget: const BulkCreateSkippedScreen()),
                );
              },
              child: Text('invoices.bulk_create.see_details'.tr()),
            ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('invoices.bulk_create.done'.tr()),
          ),
        ],
        _BulkCreateStep.error => [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('invoices.bulk_create.close'.tr()),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              _step = _BulkCreateStep.confirm;
              _errorMessage = null;
            }),
            child: Text('invoices.bulk_create.try_again'.tr()),
          ),
        ],
      },
    );
  }
}
