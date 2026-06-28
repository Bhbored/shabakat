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
  customerType: $enumDecode(_$CustomerTypeEnumMap, json['customerType']),
  plan: $enumDecode(_$PlanTypeEnumMap, json['plan']),
  planValue: (json['planValue'] as num).toDouble(),
  subscriptionDate: _dateOnlyFromJson(json['subscriptionDate'] as String?),
  customerRelation: $enumDecodeNullable(
    _$CustomerRelationEnumMap,
    json['customerRelation'],
  ),
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
  'customerType': _$CustomerTypeEnumMap[instance.customerType]!,
  'plan': _$PlanTypeEnumMap[instance.plan]!,
  'planValue': instance.planValue,
  'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
  'customerRelation': _$CustomerRelationEnumMap[instance.customerRelation],
  'pricingOverride': instance.pricingOverride,
};

const _$CustomerTypeEnumMap = {
  CustomerType.residential: 'residential',
  CustomerType.commercial: 'commercial',
  CustomerType.industrial: 'industrial',
};

const _$PlanTypeEnumMap = {
  PlanType.ampere: 'ampere',
  PlanType.kilowatt: 'kilowatt',
  PlanType.fixedKilowatt: 'fixedKilowatt',
};

const _$CustomerRelationEnumMap = {
  CustomerRelation.friend: 'friend',
  CustomerRelation.family: 'family',
  CustomerRelation.owner: 'owner',
};
