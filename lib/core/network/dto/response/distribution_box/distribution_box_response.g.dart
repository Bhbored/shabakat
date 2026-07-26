// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistributionBoxResponse _$DistributionBoxResponseFromJson(
  Map<String, dynamic> json,
) => _DistributionBoxResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  areaId: json['areaId'] as String,
  areaName: json['areaName'] as String,
  locationNote: json['locationNote'] as String?,
  notes: json['notes'] as String?,
  customerCount: (json['customerCount'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$DistributionBoxResponseToJson(
  _DistributionBoxResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'areaId': instance.areaId,
  'areaName': instance.areaName,
  'locationNote': instance.locationNote,
  'notes': instance.notes,
  'customerCount': instance.customerCount,
  'createdAt': instance.createdAt.toIso8601String(),
};
