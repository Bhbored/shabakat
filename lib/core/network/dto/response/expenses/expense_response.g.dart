// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) =>
    _ExpenseResponse(
      id: json['id'] as String,
      fuelExpense: (json['fuelExpense'] as num).toDouble(),
      maintenanceExpenses: (json['maintenanceExpenses'] as num).toDouble(),
      employeesExpenses: (json['employeesExpenses'] as num).toDouble(),
      otherExpensesTotal: (json['otherExpensesTotal'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      expenseDate: _dateOnlyFromJson(json['expenseDate'] as String),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      otherExpenses: (json['otherExpenses'] as List<dynamic>)
          .map((e) => OtherExpenseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpenseResponseToJson(_ExpenseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fuelExpense': instance.fuelExpense,
      'maintenanceExpenses': instance.maintenanceExpenses,
      'employeesExpenses': instance.employeesExpenses,
      'otherExpensesTotal': instance.otherExpensesTotal,
      'totalExpense': instance.totalExpense,
      'expenseDate': _dateOnlyToJson(instance.expenseDate),
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'otherExpenses': instance.otherExpenses,
    };
