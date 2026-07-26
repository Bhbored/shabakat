// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistributionBox _$DistributionBoxFromJson(Map<String, dynamic> json) =>
    _DistributionBox(
      id: json['id'] as String,
      name: json['name'] as String,
      areaId: json['areaId'] as String,
      areaName: json['areaName'] as String,
      locationNote: json['locationNote'] as String?,
      notes: json['notes'] as String?,
      customerCount: (json['customerCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DistributionBoxToJson(_DistributionBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'locationNote': instance.locationNote,
      'notes': instance.notes,
      'customerCount': instance.customerCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
