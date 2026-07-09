// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistributionBoxFilterRequest _$DistributionBoxFilterRequestFromJson(
  Map<String, dynamic> json,
) => _DistributionBoxFilterRequest(
  areaId: json['areaId'] as String?,
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$DistributionBoxFilterRequestToJson(
  _DistributionBoxFilterRequest instance,
) => <String, dynamic>{
  'areaId': instance.areaId,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};
