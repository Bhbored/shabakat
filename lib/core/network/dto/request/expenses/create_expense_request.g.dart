// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateExpenseRequest _$CreateExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _CreateExpenseRequest(
  fuelExpense: (json['fuelExpense'] as num).toDouble(),
  maintenanceExpenses: (json['maintenanceExpenses'] as num).toDouble(),
  employeesExpenses: (json['employeesExpenses'] as num).toDouble(),
  expenseDate: _dateOnlyFromJson(json['expenseDate'] as String?),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateExpenseRequestToJson(
  _CreateExpenseRequest instance,
) => <String, dynamic>{
  'fuelExpense': instance.fuelExpense,
  'maintenanceExpenses': instance.maintenanceExpenses,
  'employeesExpenses': instance.employeesExpenses,
  'expenseDate': _dateOnlyToJson(instance.expenseDate),
  'notes': instance.notes,
};
