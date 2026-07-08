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
      customerCount: (json['customerCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AmpereScheduleToJson(_AmpereSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hoursPerDay': instance.hoursPerDay,
      'pricePerAmp': instance.pricePerAmp,
      'customerCount': instance.customerCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
