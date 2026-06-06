// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_other_expense_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateOtherExpenseRequest _$UpdateOtherExpenseRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateOtherExpenseRequest(
  amount: (json['amount'] as num?)?.toDouble(),
  type: json['type'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$UpdateOtherExpenseRequestToJson(
  _UpdateOtherExpenseRequest instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'type': instance.type,
  'description': instance.description,
};
