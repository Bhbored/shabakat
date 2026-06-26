// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeterReadingResponse _$MeterReadingResponseFromJson(
  Map<String, dynamic> json,
) => _MeterReadingResponse(
  id: json['id'] as String,
  readingValue: (json['readingValue'] as num).toDouble(),
  consumption: (json['consumption'] as num?)?.toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MeterReadingResponseToJson(
  _MeterReadingResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'readingValue': instance.readingValue,
  'consumption': instance.consumption,
  'createdAt': instance.createdAt.toIso8601String(),
};
