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
  planType: json['planType'] as String?,
  customerRelation: json['customerRelation'] as String?,
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
  'planType': instance.planType,
  'customerRelation': instance.customerRelation,
  'paymentFilter': instance.paymentFilter,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};
