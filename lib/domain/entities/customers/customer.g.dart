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
  totalBilled: (json['totalBilled'] as num?)?.toDouble(),
  totalPaid: (json['totalPaid'] as num?)?.toDouble(),
  totalOutstanding: (json['totalOutstanding'] as num?)?.toDouble(),
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  areaName: json['areaName'] as String?,
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
  invoices: (json['invoices'] as List<dynamic>?)
      ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
      .toList(),
  paidThisMonth: json['paidThisMonth'] as bool? ?? false,
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'companyId': instance.companyId,
  'name': instance.name,
  'totalBilled': instance.totalBilled,
  'totalPaid': instance.totalPaid,
  'totalOutstanding': instance.totalOutstanding,
  'phone': instance.phone,
  'address': instance.address,
  'areaName': instance.areaName,
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
  'invoices': instance.invoices,
  'paidThisMonth': instance.paidThisMonth,
};

const _$CustomerTypeEnumMap = {
  CustomerType.residential: 'residential',
  CustomerType.commercial: 'commercial',
  CustomerType.industrial: 'industrial',
};

const _$CustomerRelationEnumMap = {
  CustomerRelation.friend: 'friend',
  CustomerRelation.family: 'family',
  CustomerRelation.owner: 'owner',
};

const _$CustomerStatusEnumMap = {
  CustomerStatus.active: 'active',
  CustomerStatus.suspended: 'suspended',
  CustomerStatus.terminated: 'terminated',
};

const _$PlanTypeEnumMap = {
  PlanType.ampere: 'ampere',
  PlanType.kilowatt: 'kilowatt',
};
