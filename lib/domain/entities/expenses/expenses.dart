import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/expense_type.dart';

part 'expenses.freezed.dart';
part 'expenses.g.dart';

@freezed
sealed class Expense with _$Expense {
  const factory Expense({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ExpenseType expenseType,
    required DateTime expenseDate,
    required double amount,
    String? label,
    String? notes,
  }) = _Expense;

  factory Expense.empty() => Expense(
    id: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    expenseType: ExpenseType.other,
    expenseDate: DateTime.now(),
    amount: 0,
  );
  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
