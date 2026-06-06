// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AreaResponse _$AreaResponseFromJson(Map<String, dynamic> json) =>
    _AreaResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      customerCount: (json['customerCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AreaResponseToJson(_AreaResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'customerCount': instance.customerCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
