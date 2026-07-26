// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ampere_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAmpereScheduleRequest _$CreateAmpereScheduleRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAmpereScheduleRequest(
  name: json['name'] as String,
  hoursPerDay: (json['hoursPerDay'] as num).toInt(),
  pricePerAmp: (json['pricePerAmp'] as num?)?.toDouble(),
  residentialPricePerAmp: (json['residentialPricePerAmp'] as num?)?.toDouble(),
  commercialPricePerAmp: (json['commercialPricePerAmp'] as num?)?.toDouble(),
  industrialPricePerAmp: (json['industrialPricePerAmp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CreateAmpereScheduleRequestToJson(
  _CreateAmpereScheduleRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'hoursPerDay': instance.hoursPerDay,
  'pricePerAmp': instance.pricePerAmp,
  'residentialPricePerAmp': instance.residentialPricePerAmp,
  'commercialPricePerAmp': instance.commercialPricePerAmp,
  'industrialPricePerAmp': instance.industrialPricePerAmp,
};
