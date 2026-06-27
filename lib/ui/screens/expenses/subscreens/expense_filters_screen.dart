import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/filter_section/filter_section.dart';

import '../widgets/expense_card/expense_type_badge.dart';

class ExpenseFiltersScreen extends ConsumerStatefulWidget {
  const ExpenseFiltersScreen({super.key});

  @override
  ConsumerState<ExpenseFiltersScreen> createState() =>
      _ExpenseFiltersScreenState();
}

class _ExpenseFiltersScreenState extends ConsumerState<ExpenseFiltersScreen> {
  DateTime? _dateFrom;
  DateTime? _dateTo;
  ExpenseType? _expenseType;
  String? _dateFromError;
  String? _dateToError;
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

    final filter = ref.read(expenseFilterProvider);
    _dateFrom = filter.dateFrom != null ? _toDateOnly(filter.dateFrom!) : null;
    _dateTo = filter.dateTo != null ? _toDateOnly(filter.dateTo!) : null;
    _expenseType = filter.expenseType;
    _initialized = true;
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final initial = isFrom
        ? (_dateFrom ?? _today)
        : (_dateTo ?? _dateFrom ?? _today);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isAfter(_today) ? _today : initial,
      firstDate: DateTime(2000),
      lastDate: _today,
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _dateFrom = _toDateOnly(picked);
        _dateFromError = null;
      } else {
        _dateTo = _toDateOnly(picked);
        _dateToError = null;
      }
    });
  }

  bool _validateDates() {
    var isValid = true;
    String? fromError;
    String? toError;

    if (_dateFrom != null && _dateFrom!.isAfter(_today)) {
      fromError = 'expenses.filter.future_date'.tr();
      isValid = false;
    }
    if (_dateTo != null && _dateTo!.isAfter(_today)) {
      toError = 'expenses.filter.future_date'.tr();
      isValid = false;
    }

    setState(() {
      _dateFromError = fromError;
      _dateToError = toError;
    });
    return isValid;
  }

  void _applyFilters() {
    if (!_validateDates()) return;

    final normalizedTo = _dateTo ?? (_dateFrom != null ? _today : null);

    ref.read(expenseFilterProvider.notifier).updateFilter(
          ref.read(expenseFilterProvider).copyWith(
                dateFrom: _dateFrom,
                dateTo: normalizedTo,
                expenseType: _expenseType,
                pageNumber: 1,
              ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = ref.watch(expenseProvider).isLoading;

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
            Text('expenses.filter.date_from'.tr(), style: theme.textTheme.titleMedium),
            SizedBox(height: context.spaceSmall),
            _DateFilterField(
              value: _formatDate(_dateFrom),
              isPlaceholder: _dateFrom == null,
              errorText: _dateFromError,
              onTap: () => _pickDate(isFrom: true),
              onClear: _dateFrom != null
                  ? () => setState(() {
                      _dateFrom = null;
                      _dateFromError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            Text('expenses.filter.date_to'.tr(), style: theme.textTheme.titleMedium),
            SizedBox(height: context.spaceSmall),
            _DateFilterField(
              value: _formatDate(_dateTo),
              isPlaceholder: _dateTo == null,
              errorText: _dateToError,
              onTap: () => _pickDate(isFrom: false),
              onClear: _dateTo != null
                  ? () => setState(() {
                      _dateTo = null;
                      _dateToError = null;
                    })
                  : null,
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<ExpenseType>(
              title: 'expenses.filter.expense_type'.tr(),
              value: _expenseType,
              items: ExpenseType.values,
              labelBuilder: ExpenseTypeBadge.labelFor,
              onChanged: (value) => setState(() => _expenseType = value),
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

class _DateFilterField extends StatelessWidget {
  final String value;
  final bool isPlaceholder;
  final String? errorText;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const _DateFilterField({
    required this.value,
    required this.isPlaceholder,
    this.errorText,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingMedium,
                    vertical: context.spaceMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: hasError ? colorScheme.error : colorScheme.outline,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: hasError
                                ? colorScheme.error
                                : isPlaceholder
                                ? colorScheme.onSurface.withValues(alpha: 0.5)
                                : null,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: hasError
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (onClear != null) ...[
              SizedBox(width: context.paddingSmall * 0.5),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: onClear,
              ),
            ],
          ],
        ),
        if (hasError) ...[
          SizedBox(height: context.spaceSmall),
          Text(
            errorText!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.error,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }
}
