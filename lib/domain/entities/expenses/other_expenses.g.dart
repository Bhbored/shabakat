// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtherExpenses _$OtherExpensesFromJson(Map<String, dynamic> json) =>
    _OtherExpenses(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      companyId: json['companyId'] as String,
      expenseId: json['expenseId'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$OtherExpensesToJson(_OtherExpenses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'companyId': instance.companyId,
      'expenseId': instance.expenseId,
      'amount': instance.amount,
      'type': instance.type,
      'description': instance.description,
    };
