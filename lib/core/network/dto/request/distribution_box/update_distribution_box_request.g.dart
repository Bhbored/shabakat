// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_distribution_box_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateDistributionBoxRequest _$UpdateDistributionBoxRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateDistributionBoxRequest(
  name: json['name'] as String,
  areaId: json['areaId'] as String,
  locationNote: json['locationNote'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$UpdateDistributionBoxRequestToJson(
  _UpdateDistributionBoxRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'areaId': instance.areaId,
  'locationNote': instance.locationNote,
  'notes': instance.notes,
};
