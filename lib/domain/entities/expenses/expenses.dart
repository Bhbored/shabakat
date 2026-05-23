import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses.freezed.dart';
part 'expenses.g.dart';

@freezed
sealed class Expenses with _$Expenses {
  const factory Expenses({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isDeleted,
    required String companyId,
    required double fuelExpense,
    required double maintenanceExpenses,
    required double employeesExpenses,
    required DateTime expenseDate,
    String? notes,
  }) = _Expenses;

  factory Expenses.fromJson(Map<String, dynamic> json) =>
      _$ExpensesFromJson(json);
}
