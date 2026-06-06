// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseSummaryResponse _$ExpenseSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _ExpenseSummaryResponse(
  id: json['id'] as String,
  fuelExpense: (json['fuelExpense'] as num).toDouble(),
  maintenanceExpenses: (json['maintenanceExpenses'] as num).toDouble(),
  employeesExpenses: (json['employeesExpenses'] as num).toDouble(),
  otherExpensesTotal: (json['otherExpensesTotal'] as num).toDouble(),
  totalExpense: (json['totalExpense'] as num).toDouble(),
  expenseDate: _dateOnlyFromJson(json['expenseDate'] as String),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ExpenseSummaryResponseToJson(
  _ExpenseSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'fuelExpense': instance.fuelExpense,
  'maintenanceExpenses': instance.maintenanceExpenses,
  'employeesExpenses': instance.employeesExpenses,
  'otherExpensesTotal': instance.otherExpensesTotal,
  'totalExpense': instance.totalExpense,
  'expenseDate': _dateOnlyToJson(instance.expenseDate),
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
};
