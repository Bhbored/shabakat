// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_preferences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPreferencesResponse _$GetPreferencesResponseFromJson(
  Map<String, dynamic> json,
) => _GetPreferencesResponse(
  pricePerKilowat: (json['pricePerKilowat'] as num).toDouble(),
  pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  language: json['language'] as String,
  triggerDate: (json['triggerDate'] as num).toInt(),
  triggerMessage: json['triggerMessage'] as String?,
);

Map<String, dynamic> _$GetPreferencesResponseToJson(
  _GetPreferencesResponse instance,
) => <String, dynamic>{
  'pricePerKilowat': instance.pricePerKilowat,
  'pricePerAmp': instance.pricePerAmp,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'language': instance.language,
  'triggerDate': instance.triggerDate,
  'triggerMessage': instance.triggerMessage,
};
