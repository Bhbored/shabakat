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
  areaId: json['areaId'] as String?,
  address: json['address'] as String?,
  building: json['building'] as String?,
  floor: json['floor'] as String?,
  cableName: json['cableName'] as String?,
  boxId: json['boxId'] as String?,
  ampereScheduleId: json['ampereScheduleId'] as String?,
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
  'areaId': instance.areaId,
  'address': instance.address,
  'building': instance.building,
  'floor': instance.floor,
  'cableName': instance.cableName,
  'boxId': instance.boxId,
  'ampereScheduleId': instance.ampereScheduleId,
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
