// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ampere_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AmpereScheduleResponse _$AmpereScheduleResponseFromJson(
  Map<String, dynamic> json,
) => _AmpereScheduleResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  hoursPerDay: (json['hoursPerDay'] as num).toInt(),
  pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
  residentialPricePerAmp: (json['residentialPricePerAmp'] as num).toDouble(),
  commercialPricePerAmp: (json['commercialPricePerAmp'] as num).toDouble(),
  industrialPricePerAmp: (json['industrialPricePerAmp'] as num).toDouble(),
  customerCount: (json['customerCount'] as num).toInt(),
  canBeDeleted: json['canBeDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AmpereScheduleResponseToJson(
  _AmpereScheduleResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'hoursPerDay': instance.hoursPerDay,
  'pricePerAmp': instance.pricePerAmp,
  'residentialPricePerAmp': instance.residentialPricePerAmp,
  'commercialPricePerAmp': instance.commercialPricePerAmp,
  'industrialPricePerAmp': instance.industrialPricePerAmp,
  'customerCount': instance.customerCount,
  'canBeDeleted': instance.canBeDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
};
