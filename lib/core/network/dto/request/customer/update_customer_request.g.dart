// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCustomerRequest _$UpdateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCustomerRequest(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  areaId: json['areaId'] as String?,
  customerType: $enumDecodeNullable(
    _$CustomerTypeEnumMap,
    json['customerType'],
  ),
  plan: $enumDecodeNullable(_$PlanTypeEnumMap, json['plan']),
  planValue: (json['planValue'] as num?)?.toDouble(),
  customerStatus: $enumDecodeNullable(
    _$CustomerStatusEnumMap,
    json['customerStatus'],
  ),
  customerRelation: $enumDecodeNullable(
    _$CustomerRelationEnumMap,
    json['customerRelation'],
  ),
  pricingOverride: json['pricingOverride'] == null
      ? null
      : CustomerPricingOverrideDto.fromJson(
          json['pricingOverride'] as Map<String, dynamic>,
        ),
  clearPricingOverride: json['clearPricingOverride'] as bool? ?? false,
);

Map<String, dynamic> _$UpdateCustomerRequestToJson(
  _UpdateCustomerRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'areaId': instance.areaId,
  'customerType': _$CustomerTypeEnumMap[instance.customerType],
  'plan': _$PlanTypeEnumMap[instance.plan],
  'planValue': instance.planValue,
  'customerStatus': _$CustomerStatusEnumMap[instance.customerStatus],
  'customerRelation': _$CustomerRelationEnumMap[instance.customerRelation],
  'pricingOverride': instance.pricingOverride,
  'clearPricingOverride': instance.clearPricingOverride,
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

const _$CustomerStatusEnumMap = {
  CustomerStatus.active: 'active',
  CustomerStatus.suspended: 'suspended',
  CustomerStatus.terminated: 'terminated',
};

const _$CustomerRelationEnumMap = {
  CustomerRelation.friend: 'friend',
  CustomerRelation.family: 'family',
  CustomerRelation.owner: 'owner',
};
