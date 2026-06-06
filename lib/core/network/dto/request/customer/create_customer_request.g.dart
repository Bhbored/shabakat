// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCustomerRequest _$CreateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCustomerRequest(
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  areaId: json['areaId'] as String?,
  customerType: json['customerType'] as String,
  plan: json['plan'] as String,
  planValue: (json['planValue'] as num).toDouble(),
  subscriptionDate: _dateOnlyFromJson(json['subscriptionDate'] as String?),
  customerRelation: json['customerRelation'] as String?,
  pricingOverride: json['pricingOverride'] == null
      ? null
      : CustomerPricingOverrideDto.fromJson(
          json['pricingOverride'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CreateCustomerRequestToJson(
  _CreateCustomerRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'areaId': instance.areaId,
  'customerType': instance.customerType,
  'plan': instance.plan,
  'planValue': instance.planValue,
  'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
  'customerRelation': instance.customerRelation,
  'pricingOverride': instance.pricingOverride,
};
