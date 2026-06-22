// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseResponse _$ExpenseResponseFromJson(Map<String, dynamic> json) =>
    _ExpenseResponse(
      id: json['id'] as String,
      expenseType: json['expenseType'] as String,
      amount: (json['amount'] as num).toDouble(),
      expenseDate: _dateOnlyFromJson(json['expenseDate'] as String),
      label: json['label'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ExpenseResponseToJson(_ExpenseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expenseType': instance.expenseType,
      'amount': instance.amount,
      'expenseDate': _dateOnlyToJson(instance.expenseDate),
      'label': instance.label,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
