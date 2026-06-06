// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerSummaryResponse _$CustomerSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _CustomerSummaryResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  customerType: json['customerType'] as String,
  plan: json['plan'] as String,
  areaName: json['areaName'] as String?,
  planValue: (json['planValue'] as num).toDouble(),
  customerStatus: json['customerStatus'] as String,
  subscriptionDate: _dateOnlyFromJson(json['subscriptionDate'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  hasPricingOverride: json['hasPricingOverride'] as bool,
  customerRelation: json['customerRelation'] as String?,
  amountDue: (json['amountDue'] as num).toDouble(),
);

Map<String, dynamic> _$CustomerSummaryResponseToJson(
  _CustomerSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'customerType': instance.customerType,
  'plan': instance.plan,
  'areaName': instance.areaName,
  'planValue': instance.planValue,
  'customerStatus': instance.customerStatus,
  'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
  'createdAt': instance.createdAt.toIso8601String(),
  'hasPricingOverride': instance.hasPricingOverride,
  'customerRelation': instance.customerRelation,
  'amountDue': instance.amountDue,
};
