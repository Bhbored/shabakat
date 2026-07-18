import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/invoice/update_invoice_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/data/providers/invoice/single_invoice_provider.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'invoice_edit_date_field.dart';
import 'invoice_edit_sheet_header.dart';

class InvoiceEditSheet extends ConsumerStatefulWidget {
  final String invoiceId;
  final Invoice invoice;

  const InvoiceEditSheet({
    super.key,
    required this.invoiceId,
    required this.invoice,
  });

  static Future<void> show(
    BuildContext context, {
    required String invoiceId,
    required Invoice invoice,
  }) {
    return showAppFormBottomSheet<void>(
      context: context,
      builder: (_) => InvoiceEditSheet(invoiceId: invoiceId, invoice: invoice),
    );
  }

  @override
  ConsumerState<InvoiceEditSheet> createState() => _InvoiceEditSheetState();
}

class _InvoiceEditSheetState extends ConsumerState<InvoiceEditSheet> {
  late DateTime _issueDate;
  late DateTime _dueDate;
  String? _issueDateError;
  String? _dueDateError;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _issueDate = _toDateOnly(widget.invoice.issueDate);
    _dueDate = _toDateOnly(widget.invoice.dueDate);
  }

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  bool get _hasChanges =>
      !_sameDate(_issueDate, widget.invoice.issueDate) ||
      !_sameDate(_dueDate, widget.invoice.dueDate);

  bool _sameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Future<void> _pickIssueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _issueDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _issueDate = _toDateOnly(picked);
        _issueDateError = null;
        if (_dueDate.isBefore(_issueDate)) {
          _dueDate = _issueDate;
          _dueDateError = null;
        }
      });
    }
  }

  Future<void> _pickDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate.isBefore(_issueDate) ? _issueDate : _dueDate,
      firstDate: _issueDate,
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dueDate = _toDateOnly(picked);
        _dueDateError = null;
      });
    }
  }

  bool _validate() {
    var valid = true;
    String? issueError;
    String? dueError;

    if (_dueDate.isBefore(_issueDate)) {
      dueError = 'invoices.edit.validation.due_before_issue'.tr();
      valid = false;
    }

    setState(() {
      _issueDateError = issueError;
      _dueDateError = dueError;
    });
    return valid;
  }

  Future<void> _onSave() async {
    if (!_validate() || !_hasChanges) return;

    setState(() => _isSaving = true);

    final request = UpdateInvoiceRequest(
      consumptionStart: _issueDate,
      consumptionEnd: _dueDate,
    );

    try {
      await ref
          .read(invoiceProvider.notifier)
          .updateInvoice(request, widget.invoiceId);
      await ref.read(singleInvoiceProvider(widget.invoiceId).notifier).refresh();
      if (!mounted) return;
      Navigator.of(context).pop();
      AppSnackBar.show(
        context,
        message: 'invoices.edit.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'invoices.edit.failed'.tr();
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSaving = _isSaving || ref.watch(invoiceProvider).isLoading;

    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceEditSheetHeader(
              isSaving: isSaving,
              onClose: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InvoiceEditDateField(
                      label: 'invoices.edit.issue_date'.tr(),
                      date: _issueDate,
                      errorText: _issueDateError,
                      enabled: !isSaving,
                      onTap: _pickIssueDate,
                    ),
                    SizedBox(height: context.spaceMedium),
                    InvoiceEditDateField(
                      label: 'invoices.edit.due_date'.tr(),
                      date: _dueDate,
                      errorText: _dueDateError,
                      enabled: !isSaving,
                      onTap: _pickDueDate,
                    ),
                    SizedBox(height: context.spaceExtraLarge),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            isSaving || !_hasChanges ? null : _onSave,
                        child: isSaving
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'invoices.edit.save_changes'.tr(),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
