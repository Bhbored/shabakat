// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateExpenseRequest _$CreateExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _CreateExpenseRequest(
  expenseType: json['expenseType'] as String,
  amount: (json['amount'] as num).toDouble(),
  expenseDate: _dateOnlyFromJson(json['expenseDate'] as String?),
  label: json['label'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateExpenseRequestToJson(
  _CreateExpenseRequest instance,
) => <String, dynamic>{
  'expenseType': instance.expenseType,
  'amount': instance.amount,
  'expenseDate': _dateOnlyToJson(instance.expenseDate),
  'label': instance.label,
  'notes': instance.notes,
};
