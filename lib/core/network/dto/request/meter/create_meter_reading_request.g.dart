// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meter_reading_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMeterReadingRequest _$CreateMeterReadingRequestFromJson(
  Map<String, dynamic> json,
) => _CreateMeterReadingRequest(
  readingValue: (json['readingValue'] as num).toDouble(),
  readingDate: _dateOnlyFromJson(json['readingDate'] as String?),
);

Map<String, dynamic> _$CreateMeterReadingRequestToJson(
  _CreateMeterReadingRequest instance,
) => <String, dynamic>{
  'readingValue': instance.readingValue,
  'readingDate': _dateOnlyToJson(instance.readingDate),
};
