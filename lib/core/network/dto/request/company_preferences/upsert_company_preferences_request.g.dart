// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_company_preferences_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpsertCompanyPreferencesRequest _$UpsertCompanyPreferencesRequestFromJson(
  Map<String, dynamic> json,
) => _UpsertCompanyPreferencesRequest(
  pricePerKilowat: (json['pricePerKilowat'] as num).toDouble(),
  pricePerAmp: (json['pricePerAmp'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  language: json['language'] as String? ?? 'en',
  triggerDate: (json['triggerDate'] as num?)?.toInt() ?? 1,
  triggerMessage: json['triggerMessage'] as String?,
);

Map<String, dynamic> _$UpsertCompanyPreferencesRequestToJson(
  _UpsertCompanyPreferencesRequest instance,
) => <String, dynamic>{
  'pricePerKilowat': instance.pricePerKilowat,
  'pricePerAmp': instance.pricePerAmp,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'language': instance.language,
  'triggerDate': instance.triggerDate,
  'triggerMessage': instance.triggerMessage,
};
