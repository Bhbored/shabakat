// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_expense_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtherExpenseResponse _$OtherExpenseResponseFromJson(
  Map<String, dynamic> json,
) => _OtherExpenseResponse(
  id: json['id'] as String,
  expenseId: json['expenseId'] as String,
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OtherExpenseResponseToJson(
  _OtherExpenseResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'expenseId': instance.expenseId,
  'amount': instance.amount,
  'type': instance.type,
  'description': instance.description,
  'createdAt': instance.createdAt.toIso8601String(),
};
