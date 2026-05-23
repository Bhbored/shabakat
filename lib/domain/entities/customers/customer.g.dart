// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  companyId: json['companyId'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  customerType: json['customerType'] as String,
  subscriptionDate: DateTime.parse(json['subscriptionDate'] as String),
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
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'companyId': instance.companyId,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'customerType': instance.customerType,
  'subscriptionDate': instance.subscriptionDate.toIso8601String(),
  'customerStatus': _$CustomerStatusEnumMap[instance.customerStatus]!,
  'plan': _$PlanTypeEnumMap[instance.plan]!,
  'planValue': instance.planValue,
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
