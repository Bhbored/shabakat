import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/enums/expense_type.dart';
import 'package:shabakat/core/network/dto/response/expenses/expense_response.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension ExpenseResponseMapper on ExpenseResponse {
  Expense toEntity() => Expense(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    expenseType: expenseType.toExpenseType(),
    expenseDate: expenseDate,
    amount: amount,
    label: label,
    notes: notes,
  );
}

extension ExpenseEntityMapper on Expense {
  drift.ExpensesTableCompanion toCompanion() => drift.ExpensesTableCompanion(
    id: Value(id),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
    expenseType: Value(expenseType.name),
    expenseDate: Value(expenseDate),
    amount: Value(amount),
    label: Value(label),
    notes: Value(notes),
  );
}

extension ExpenseDriftMapper on drift.Expense {
  Expense toEntity() => Expense(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    expenseType: expenseType.toExpenseType(),
    expenseDate: expenseDate,
    amount: amount,
    label: label,
    notes: notes,
  );
}
