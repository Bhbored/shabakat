import 'package:shabakat/core/network/dto/response/expenses/expense_response.dart';
import 'package:shabakat/core/network/dto/response/expenses/expense_summary_response.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/other_expense_mapper.dart';

extension ExpenseResponseMapper on ExpenseResponse {
  Expenses toEntity() => Expenses(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    fuelExpense: fuelExpense,
    maintenanceExpenses: maintenanceExpenses,
    employeesExpenses: employeesExpenses,
    expenseDate: expenseDate,
    notes: notes,
    otherExpenses: otherExpenses.map((o) => o.toEntity()).toList(),
  );
}

extension ExpenseSummaryResponseMapper on ExpenseSummaryResponse {
  Expenses toEntity() => Expenses(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    fuelExpense: fuelExpense,
    maintenanceExpenses: maintenanceExpenses,
    employeesExpenses: employeesExpenses,
    expenseDate: expenseDate,
    notes: notes,
  );
}
