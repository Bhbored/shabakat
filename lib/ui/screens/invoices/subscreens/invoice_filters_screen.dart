import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/filter_section/filter_section.dart';

import '../widgets/invoice_filters/invoice_filter_date_field.dart';

class InvoiceFiltersScreen extends ConsumerStatefulWidget {
  const InvoiceFiltersScreen({super.key});

  @override
  ConsumerState<InvoiceFiltersScreen> createState() =>
      _InvoiceFiltersScreenState();
}

class _InvoiceFiltersScreenState extends ConsumerState<InvoiceFiltersScreen> {
  DateTime? _issueDateFrom;
  DateTime? _issueDateTo;
  InvoiceStatus? _invoiceStatus;
  String? _issueDateFromError;
  String? _issueDateToError;
  bool _initialized = false;

  DateTime get _today => _toDateOnly(DateTime.now());

  DateTime _toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  String _formatDate(DateTime? date) {
    if (date == null) return 'common.all'.tr();
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(invoiceFilterProvider);
    _issueDateFrom = filter.issueDateFrom != null
        ? _toDateOnly(filter.issueDateFrom!)
        : null;
    _issueDateTo = filter.issueDateTo != null
        ? _toDateOnly(filter.issueDateTo!)
        : null;
    _invoiceStatus = filter.invoiceStatus;
    _initialized = true;
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom
        ? (_issueDateFrom ?? _today)
        : (_issueDateTo ?? _issueDateFrom ?? _today);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(_today) ? _today : initial,
      firstDate: DateTime(2000),
      lastDate: _today,
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _issueDateFrom = _toDateOnly(picked);
        _issueDateFromError = null;
      } else {
        _issueDateTo = _toDateOnly(picked);
        _issueDateToError = null;
      }
    });
  }

  bool _validateDates() {
    var isValid = true;
    String? fromError;
    String? toError;

    if (_issueDateFrom != null && _issueDateFrom!.isAfter(_today)) {
      fromError = 'expenses.filter.future_date'.tr();
      isValid = false;
    }
    if (_issueDateTo != null && _issueDateTo!.isAfter(_today)) {
      toError = 'expenses.filter.future_date'.tr();
      isValid = false;
    }

    setState(() {
      _issueDateFromError = fromError;
      _issueDateToError = toError;
    });
    return isValid;
  }

  void _applyFilters() {
    if (!_validateDates()) return;

    final normalizedTo =
        _issueDateTo ?? (_issueDateFrom != null ? _today : null);

    ref.read(invoiceFilterProvider.notifier).updateFilter(
          ref.read(invoiceFilterProvider).copyWith(
                issueDateFrom: _issueDateFrom,
                issueDateTo: normalizedTo,
                invoiceStatus: _invoiceStatus,
                pageNumber: 1,
              ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = ref.watch(invoiceProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('expenses.filter.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'invoices.filter.issue_date_from'.tr(),
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: context.spaceSmall),
            InvoiceFilterDateField(
              value: _formatDate(_issueDateFrom),
              errorText: _issueDateFromError,
              onTap: () => _pickDate(isFrom: true),
              onClear: _issueDateFrom != null
                  ? () => setState(() {
                      _issueDateFrom = null;
                      _issueDateFromError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            Text(
              'invoices.filter.issue_date_to'.tr(),
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(height: context.spaceSmall),
            InvoiceFilterDateField(
              value: _formatDate(_issueDateTo),
              errorText: _issueDateToError,
              onTap: () => _pickDate(isFrom: false),
              onClear: _issueDateTo != null
                  ? () => setState(() {
                      _issueDateTo = null;
                      _issueDateToError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<InvoiceStatus>(
              title: 'invoices.filter.status'.tr(),
              value: _invoiceStatus,
              items: InvoiceStatus.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _invoiceStatus = value),
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : _applyFilters,
                child: isLoading
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        'expenses.filter.apply'.tr(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
