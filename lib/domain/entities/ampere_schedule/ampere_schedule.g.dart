// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ampere_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AmpereSchedule _$AmpereScheduleFromJson(Map<String, dynamic> json) =>
    _AmpereSchedule(
      id: json['id'] as String,
      name: json['name'] as String,
      hoursPerDay: (json['hoursPerDay'] as num).toInt(),
      pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
      residentialPricePerAmp:
          (json['residentialPricePerAmp'] as num?)?.toDouble() ?? 0,
      commercialPricePerAmp:
          (json['commercialPricePerAmp'] as num?)?.toDouble() ?? 0,
      industrialPricePerAmp:
          (json['industrialPricePerAmp'] as num?)?.toDouble() ?? 0,
      customerCount: (json['customerCount'] as num?)?.toInt() ?? 0,
      canBeDeleted: json['canBeDeleted'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AmpereScheduleToJson(_AmpereSchedule instance) =>
    <String, dynamic>{
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
