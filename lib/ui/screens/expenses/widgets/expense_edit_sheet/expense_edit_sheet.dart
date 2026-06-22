import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/data/providers/expense/single_expense_provider.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/ui/screens/expenses/expense_form_validators.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../expense_adding/expense_add_date_field.dart';
import '../expense_adding/expense_add_dropdown.dart';
import '../expense_adding/expense_add_form_field.dart';

class ExpenseEditSheet extends ConsumerStatefulWidget {
  final String expenseId;
  final Expense expense;

  const ExpenseEditSheet({
    super.key,
    required this.expenseId,
    required this.expense,
  });

  static Future<void> show(
    BuildContext context, {
    required String expenseId,
    required Expense expense,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => ExpenseEditSheet(expenseId: expenseId, expense: expense),
    );
  }

  @override
  ConsumerState<ExpenseEditSheet> createState() => _ExpenseEditSheetState();
}

class _ExpenseEditSheetState extends ConsumerState<ExpenseEditSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _labelController;
  late final TextEditingController _notesController;

  late ExpenseType _expenseType;
  late DateTime _expenseDate;
  String? _dateError;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final expense = widget.expense;
    _amountController = TextEditingController(
      text: expense.amount.toStringAsFixed(2),
    );
    _labelController = TextEditingController(text: expense.label ?? '');
    _notesController = TextEditingController(text: expense.notes ?? '');
    _expenseType = expense.expenseType;
    _expenseDate = ExpenseFormValidators.toDateOnly(expense.expenseDate);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _labelController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expenseDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _expenseDate = ExpenseFormValidators.toDateOnly(picked);
        _dateError = null;
      });
    }
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    final dateError = ExpenseFormValidators.expenseDate(_expenseDate);
    if (dateError != null) {
      setState(() => _dateError = dateError);
      return;
    }

    setState(() => _isSaving = true);

    final label = _labelController.text.trim();
    final notes = _notesController.text.trim();

    final request = UpdateExpenseRequest(
      expenseType: _expenseType.label,
      amount: double.parse(_amountController.text.trim()),
      expenseDate: _expenseDate,
      label: label.isEmpty ? null : label,
      notes: notes.isEmpty ? null : notes,
    );

    try {
      await ref
          .read(expenseProvider.notifier)
          .updateExpense(request, widget.expenseId);
      await ref.read(singleExpenseProvider(widget.expenseId).notifier).refresh();
      if (!mounted) return;
      Navigator.of(context).pop();
      AppSnackBar.show(
        context,
        message: 'Expense updated',
        variant: AppSnackBarVariant.success,
      );
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to update expense. Please try again.';
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
    final isSaving =
        _isSaving || ref.watch(expenseProvider).isLoading;

    return Padding(
      padding: EdgeInsets.only(bottom: context.viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.paddingMedium,
                context.paddingSmall,
                context.paddingMedium,
                context.paddingSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Edit Expense',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: isSaving ? null : () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpenseAddDropdown<ExpenseType>(
                        label: 'Expense Type',
                        value: _expenseType,
                        items: ExpenseType.values,
                        itemLabel: (e) => e.label,
                        enabled: !isSaving,
                        onChanged: (v) => setState(() => _expenseType = v!),
                      ),
                      SizedBox(height: context.spaceMedium),
                      ExpenseAddFormField(
                        label: 'Amount',
                        controller: _amountController,
                        hint: '0.00',
                        enabled: !isSaving,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: ExpenseFormValidators.amount,
                      ),
                      SizedBox(height: context.spaceMedium),
                      ExpenseAddDateField(
                        date: _expenseDate,
                        errorText: _dateError,
                        enabled: !isSaving,
                        onTap: _pickDate,
                      ),
                      SizedBox(height: context.spaceMedium),
                      ExpenseAddFormField(
                        label: 'Label',
                        controller: _labelController,
                        hint: _expenseType == ExpenseType.other
                            ? 'Required for Other'
                            : 'Optional label',
                        enabled: !isSaving,
                        maxLength: ExpenseFormValidators.labelMaxLength,
                        validator: (value) => ExpenseFormValidators.label(
                          value,
                          expenseType: _expenseType,
                        ),
                      ),
                      SizedBox(height: context.spaceMedium),
                      ExpenseAddFormField(
                        label: 'Notes',
                        controller: _notesController,
                        hint: 'Optional notes',
                        enabled: !isSaving,
                        maxLines: 3,
                        maxLength: ExpenseFormValidators.notesMaxLength,
                        validator: ExpenseFormValidators.notes,
                      ),
                      SizedBox(height: context.spaceExtraLarge),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isSaving ? null : _onSave,
                          child: isSaving
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Save Changes',
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
            ),
          ],
        ),
      ),
    );
  }
}
