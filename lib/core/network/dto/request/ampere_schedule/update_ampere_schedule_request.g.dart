// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ampere_schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateAmpereScheduleRequest _$UpdateAmpereScheduleRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAmpereScheduleRequest(
  name: json['name'] as String,
  hoursPerDay: (json['hoursPerDay'] as num).toInt(),
  pricePerAmp: (json['pricePerAmp'] as num?)?.toDouble(),
  residentialPricePerAmp: (json['residentialPricePerAmp'] as num?)?.toDouble(),
  commercialPricePerAmp: (json['commercialPricePerAmp'] as num?)?.toDouble(),
  industrialPricePerAmp: (json['industrialPricePerAmp'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UpdateAmpereScheduleRequestToJson(
  _UpdateAmpereScheduleRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'hoursPerDay': instance.hoursPerDay,
  'pricePerAmp': instance.pricePerAmp,
  'residentialPricePerAmp': instance.residentialPricePerAmp,
  'commercialPricePerAmp': instance.commercialPricePerAmp,
  'industrialPricePerAmp': instance.industrialPricePerAmp,
};
