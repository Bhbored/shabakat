// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  companyId: json['companyId'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  areaId: json['areaId'] as String?,
  customerType: $enumDecode(_$CustomerTypeEnumMap, json['customerType']),
  customerRelation: $enumDecodeNullable(
    _$CustomerRelationEnumMap,
    json['customerRelation'],
  ),
  subscriptionDate: DateTime.parse(json['subscriptionDate'] as String),
  priceOverride: (json['priceOverride'] as num?)?.toDouble(),
  fixedChargeOverride: (json['fixedChargeOverride'] as num?)?.toDouble(),
  tvaOverride: (json['tvaOverride'] as num?)?.toDouble(),
  customerStatus:
      $enumDecodeNullable(_$CustomerStatusEnumMap, json['customerStatus']) ??
      CustomerStatus.active,
  plan: $enumDecode(_$PlanTypeEnumMap, json['plan']),
  planValue: (json['planValue'] as num).toDouble(),
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'companyId': instance.companyId,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'areaId': instance.areaId,
  'customerType': _$CustomerTypeEnumMap[instance.customerType]!,
  'customerRelation': _$CustomerRelationEnumMap[instance.customerRelation],
  'subscriptionDate': instance.subscriptionDate.toIso8601String(),
  'priceOverride': instance.priceOverride,
  'fixedChargeOverride': instance.fixedChargeOverride,
  'tvaOverride': instance.tvaOverride,
  'customerStatus': _$CustomerStatusEnumMap[instance.customerStatus]!,
  'plan': _$PlanTypeEnumMap[instance.plan]!,
  'planValue': instance.planValue,
};

const _$CustomerTypeEnumMap = {
  CustomerType.residential: 'Residential',
  CustomerType.commercial: 'Commercial',
  CustomerType.industrial: 'Industrial',
};

const _$CustomerRelationEnumMap = {
  CustomerRelation.friend: 'Friend',
  CustomerRelation.family: 'Family',
  CustomerRelation.owner: 'Owner',
};

const _$CustomerStatusEnumMap = {
  CustomerStatus.active: 'Active',
  CustomerStatus.suspended: 'Suspended',
  CustomerStatus.terminated: 'Terminated',
};

const _$PlanTypeEnumMap = {
  PlanType.ampere: 'Ampere',
  PlanType.kilowatt: 'Kilowatt',
};
