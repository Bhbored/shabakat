// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_distribution_box_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDistributionBoxRequest _$CreateDistributionBoxRequestFromJson(
  Map<String, dynamic> json,
) => _CreateDistributionBoxRequest(
  name: json['name'] as String,
  areaId: json['areaId'] as String,
  locationNote: json['locationNote'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateDistributionBoxRequestToJson(
  _CreateDistributionBoxRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'areaId': instance.areaId,
  'locationNote': instance.locationNote,
  'notes': instance.notes,
};
