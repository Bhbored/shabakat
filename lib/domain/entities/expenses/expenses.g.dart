// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expenses _$ExpensesFromJson(Map<String, dynamic> json) => _Expenses(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  companyId: json['companyId'] as String,
  fuelExpense: (json['fuelExpense'] as num).toDouble(),
  maintenanceExpenses: (json['maintenanceExpenses'] as num).toDouble(),
  employeesExpenses: (json['employeesExpenses'] as num).toDouble(),
  expenseDate: DateTime.parse(json['expenseDate'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ExpensesToJson(_Expenses instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'companyId': instance.companyId,
  'fuelExpense': instance.fuelExpense,
  'maintenanceExpenses': instance.maintenanceExpenses,
  'employeesExpenses': instance.employeesExpenses,
  'expenseDate': instance.expenseDate.toIso8601String(),
  'notes': instance.notes,
};
