// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeterReading _$MeterReadingFromJson(Map<String, dynamic> json) =>
    _MeterReading(
      id: json['id'] as String,
      readingValue: (json['readingValue'] as num).toDouble(),
      consumption: (json['consumption'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MeterReadingToJson(_MeterReading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'readingValue': instance.readingValue,
      'consumption': instance.consumption,
      'createdAt': instance.createdAt.toIso8601String(),
    };
