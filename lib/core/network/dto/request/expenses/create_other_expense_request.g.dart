// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_other_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOtherExpenseRequest _$CreateOtherExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _CreateOtherExpenseRequest(
  amount: (json['amount'] as num).toDouble(),
  type: json['type'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateOtherExpenseRequestToJson(
  _CreateOtherExpenseRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'type': instance.type,
  'description': instance.description,
};
