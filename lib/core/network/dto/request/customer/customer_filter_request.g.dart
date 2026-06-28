// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerFilterRequest _$CustomerFilterRequestFromJson(
  Map<String, dynamic> json,
) => _CustomerFilterRequest(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  areaId: json['areaId'] as String?,
  planType: $enumDecodeNullable(_$PlanTypeEnumMap, json['planType']),
  customerRelation: $enumDecodeNullable(
    _$CustomerRelationEnumMap,
    json['customerRelation'],
  ),
  customerStatus: $enumDecodeNullable(
    _$CustomerStatusEnumMap,
    json['customerStatus'],
  ),
  paymentFilter: json['paymentFilter'] as String?,
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$CustomerFilterRequestToJson(
  _CustomerFilterRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'areaId': instance.areaId,
  'planType': _$PlanTypeEnumMap[instance.planType],
  'customerRelation': _$CustomerRelationEnumMap[instance.customerRelation],
  'customerStatus': _$CustomerStatusEnumMap[instance.customerStatus],
  'paymentFilter': instance.paymentFilter,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
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

const _$CustomerStatusEnumMap = {
  CustomerStatus.active: 'active',
  CustomerStatus.suspended: 'suspended',
  CustomerStatus.terminated: 'terminated',
};
