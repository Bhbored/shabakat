// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateExpenseRequest _$UpdateExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateExpenseRequest(
  expenseType: json['expenseType'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  expenseDate: _dateOnlyFromJson(json['expenseDate'] as String?),
  label: json['label'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateExpenseRequestToJson(
  _UpdateExpenseRequest instance,
) => <String, dynamic>{
  'expenseType': instance.expenseType,
  'amount': instance.amount,
  'expenseDate': _dateOnlyToJson(instance.expenseDate),
  'label': instance.label,
  'notes': instance.notes,
};
