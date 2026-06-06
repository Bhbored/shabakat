import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/domain/entities/expenses/other_expenses.dart';

part 'expenses.freezed.dart';
part 'expenses.g.dart';

@freezed
sealed class Expenses with _$Expenses {
  const factory Expenses({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String companyId,
    required double fuelExpense,
    required double maintenanceExpenses,
    required double employeesExpenses,
    required DateTime expenseDate,
    String? notes,
    List<OtherExpenses>? otherExpenses,
  }) = _Expenses;

  factory Expenses.fromJson(Map<String, dynamic> json) =>
      _$ExpensesFromJson(json);
}
