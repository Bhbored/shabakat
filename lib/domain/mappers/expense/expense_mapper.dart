import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/network/dto/response/expenses/expense_response.dart';
import 'package:shabakat/domain/entities/entities.dart';

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
