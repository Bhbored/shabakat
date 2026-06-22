import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/ui/screens/expenses/expense_form_validators.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../widgets/expense_adding/expense_add_date_field.dart';
import '../widgets/expense_adding/expense_add_dropdown.dart';
import '../widgets/expense_adding/expense_add_form_field.dart';

class ExpenseAddingScreen extends ConsumerStatefulWidget {
  const ExpenseAddingScreen({super.key});

  @override
  ConsumerState<ExpenseAddingScreen> createState() =>
      _ExpenseAddingScreenState();
}

class _ExpenseAddingScreenState extends ConsumerState<ExpenseAddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _labelController = TextEditingController();
  final _notesController = TextEditingController();

  ExpenseType _expenseType = ExpenseType.fuel;
  DateTime _expenseDate = ExpenseFormValidators.toDateOnly(DateTime.now());
  String? _dateError;
  bool _isLoading = false;

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

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final dateError = ExpenseFormValidators.expenseDate(_expenseDate);
    if (dateError != null) {
      setState(() => _dateError = dateError);
      return;
    }

    setState(() => _isLoading = true);

    final label = _labelController.text.trim();
    final notes = _notesController.text.trim();

    final request = CreateExpenseRequest(
      expenseType: _expenseType.label,
      amount: double.parse(_amountController.text.trim()),
      expenseDate: _expenseDate,
      label: label.isEmpty ? null : label,
      notes: notes.isEmpty ? null : notes,
    );

    try {
      await ref.read(expenseProvider.notifier).createExpense(request);
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'Expense added',
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to add expense. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
        ),
        title: const Text('Add Expense'),
      ),
      body: SingleChildScrollView(
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
                enabled: !_isLoading,
                onChanged: (v) => setState(() => _expenseType = v!),
              ),
              SizedBox(height: context.spaceMedium),
              ExpenseAddFormField(
                label: 'Amount',
                controller: _amountController,
                hint: '0.00',
                enabled: !_isLoading,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: ExpenseFormValidators.amount,
              ),
              SizedBox(height: context.spaceMedium),
              ExpenseAddDateField(
                date: _expenseDate,
                errorText: _dateError,
                enabled: !_isLoading,
                onTap: _pickDate,
              ),
              SizedBox(height: context.spaceMedium),
              ExpenseAddFormField(
                label: 'Label',
                controller: _labelController,
                hint: _expenseType == ExpenseType.other
                    ? 'Required for Other'
                    : 'Optional label',
                enabled: !_isLoading,
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
                enabled: !_isLoading,
                maxLines: 3,
                maxLength: ExpenseFormValidators.notesMaxLength,
                validator: ExpenseFormValidators.notes,
              ),
              SizedBox(height: context.spaceExtraLarge),
              Padding(
                padding: EdgeInsets.only(
                  bottom: context.spaceMedium + context.viewInsets.bottom,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _onSubmit,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'Add Expense',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
