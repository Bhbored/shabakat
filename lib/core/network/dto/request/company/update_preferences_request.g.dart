// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_preferences_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdatePreferencesRequest _$UpdatePreferencesRequestFromJson(
  Map<String, dynamic> json,
) => _UpdatePreferencesRequest(
  pricePerKilowat: (json['pricePerKilowat'] as num).toDouble(),
  pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  language: json['language'] as String,
  triggerDate: (json['triggerDate'] as num).toInt(),
  triggerMessage: json['triggerMessage'] as String?,
);

Map<String, dynamic> _$UpdatePreferencesRequestToJson(
  _UpdatePreferencesRequest instance,
) => <String, dynamic>{
  'pricePerKilowat': instance.pricePerKilowat,
  'pricePerAmp': instance.pricePerAmp,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'language': instance.language,
  'triggerDate': instance.triggerDate,
  'triggerMessage': instance.triggerMessage,
};
