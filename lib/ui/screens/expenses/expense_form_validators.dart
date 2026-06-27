import 'package:easy_localization/easy_localization.dart';
import 'package:shabakat/core/enums/expense_type.dart';

class ExpenseFormValidators {
  ExpenseFormValidators._();

  static const int labelMaxLength = 50;
  static const int notesMaxLength = 500;

  static DateTime toDateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String? amount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'expenses.validation.amount_required'.tr();
    }
    final amount = double.tryParse(value.trim());
    if (amount == null) return 'expenses.validation.invalid_number'.tr();
    if (amount <= 0) return 'expenses.validation.amount_positive'.tr();
    return null;
  }

  static String? label(String? value, {required ExpenseType expenseType}) {
    final trimmed = value?.trim() ?? '';
    if (expenseType == ExpenseType.other && trimmed.isEmpty) {
      return 'expenses.validation.label_required'.tr();
    }
    if (trimmed.length > labelMaxLength) {
      return 'expenses.validation.max_characters'.tr(
        args: [labelMaxLength.toString()],
      );
    }
    return null;
  }

  static String? notes(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length > notesMaxLength) {
      return 'expenses.validation.max_characters'.tr(
        args: [notesMaxLength.toString()],
      );
    }
    return null;
  }

  static String? expenseDate(DateTime date) {
    if (toDateOnly(date).isAfter(toDateOnly(DateTime.now()))) {
      return 'expenses.validation.future_date'.tr();
    }
    return null;
  }
}
