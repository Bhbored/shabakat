// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  expenseType: $enumDecode(_$ExpenseTypeEnumMap, json['expenseType']),
  expenseDate: DateTime.parse(json['expenseDate'] as String),
  amount: (json['amount'] as num).toDouble(),
  label: json['label'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'expenseType': _$ExpenseTypeEnumMap[instance.expenseType]!,
  'expenseDate': instance.expenseDate.toIso8601String(),
  'amount': instance.amount,
  'label': instance.label,
  'notes': instance.notes,
};

const _$ExpenseTypeEnumMap = {
  ExpenseType.fuel: 'fuel',
  ExpenseType.maintenance: 'maintenance',
  ExpenseType.employees: 'employees',
  ExpenseType.other: 'other',
};
