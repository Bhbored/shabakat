import 'package:shabakat/core/network/dto/response/expenses/other_expense_response.dart';
import 'package:shabakat/domain/entities/expenses/other_expenses.dart';

extension OtherExpenseResponseMapper on OtherExpenseResponse {
  OtherExpenses toEntity() => OtherExpenses(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    expenseId: expenseId,
    amount: amount,
    type: type,
    description: description,
  );
}
