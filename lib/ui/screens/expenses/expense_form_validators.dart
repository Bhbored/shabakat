import 'package:shabakat/core/enums/expense_type.dart';

class ExpenseFormValidators {
  ExpenseFormValidators._();

  static const int labelMaxLength = 50;
  static const int notesMaxLength = 500;

  static DateTime toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String? amount(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter amount';
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'Enter a valid number';
    if (amount <= 0) return 'Amount must be greater than 0';
    return null;
  }

  static String? label(String? value, {required ExpenseType expenseType}) {
    final trimmed = value?.trim() ?? '';
    if (expenseType == ExpenseType.other && trimmed.isEmpty) {
      return 'Enter a label';
    }
    if (trimmed.length > labelMaxLength) {
      return 'Max $labelMaxLength characters';
    }
    return null;
  }

  static String? notes(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length > notesMaxLength) {
      return 'Max $notesMaxLength characters';
    }
    return null;
  }

  static String? expenseDate(DateTime date) {
    if (toDateOnly(date).isAfter(toDateOnly(DateTime.now()))) {
      return 'Expense date cannot be in the future';
    }
    return null;
  }
}
