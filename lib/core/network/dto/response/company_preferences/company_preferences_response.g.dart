// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_preferences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyPreferencesResponse _$CompanyPreferencesResponseFromJson(
  Map<String, dynamic> json,
) => _CompanyPreferencesResponse(
  id: json['id'] as String,
  pricePerKilowat: (json['pricePerKilowat'] as num).toDouble(),
  pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  language: json['language'] as String,
  triggerDate: (json['triggerDate'] as num).toInt(),
  triggerMessage: json['triggerMessage'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CompanyPreferencesResponseToJson(
  _CompanyPreferencesResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'pricePerKilowat': instance.pricePerKilowat,
  'pricePerAmp': instance.pricePerAmp,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'language': instance.language,
  'triggerDate': instance.triggerDate,
  'triggerMessage': instance.triggerMessage,
  'updatedAt': instance.updatedAt.toIso8601String(),
};
