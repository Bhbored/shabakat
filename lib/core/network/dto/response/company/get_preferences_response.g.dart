// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_preferences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPreferencesResponse _$GetPreferencesResponseFromJson(
  Map<String, dynamic> json,
) => _GetPreferencesResponse(
  pricePerKilowat: (json['pricePerKilowat'] as num?)?.toDouble() ?? 0,
  pricePerAmp: (json['pricePerAmp'] as num?)?.toDouble() ?? 0,
  fixedCharge: (json['fixedCharge'] as num?)?.toDouble() ?? 0,
  tva: (json['tva'] as num?)?.toDouble() ?? 11,
  residentialPricePerAmp:
      (json['residentialPricePerAmp'] as num?)?.toDouble() ?? 0,
  residentialPricePerKilowat:
      (json['residentialPricePerKilowat'] as num?)?.toDouble() ?? 0,
  residentialFixedCharge:
      (json['residentialFixedCharge'] as num?)?.toDouble() ?? 0,
  residentialTVA: (json['residentialTVA'] as num?)?.toDouble() ?? 11,
  commercialPricePerAmp:
      (json['commercialPricePerAmp'] as num?)?.toDouble() ?? 0,
  commercialPricePerKilowat:
      (json['commercialPricePerKilowat'] as num?)?.toDouble() ?? 0,
  commercialFixedCharge:
      (json['commercialFixedCharge'] as num?)?.toDouble() ?? 0,
  commercialTVA: (json['commercialTVA'] as num?)?.toDouble() ?? 11,
  industrialPricePerAmp:
      (json['industrialPricePerAmp'] as num?)?.toDouble() ?? 0,
  industrialPricePerKilowat:
      (json['industrialPricePerKilowat'] as num?)?.toDouble() ?? 0,
  industrialFixedCharge:
      (json['industrialFixedCharge'] as num?)?.toDouble() ?? 0,
  industrialTVA: (json['industrialTVA'] as num?)?.toDouble() ?? 11,
  language: json['language'] as String? ?? 'en',
  dueDate: (json['dueDate'] as num?)?.toInt() ?? 1,
  triggerDate: (json['triggerDate'] as num?)?.toInt() ?? 1,
  triggerMessage: json['triggerMessage'] as String?,
);

Map<String, dynamic> _$GetPreferencesResponseToJson(
  _GetPreferencesResponse instance,
) => <String, dynamic>{
  'pricePerKilowat': instance.pricePerKilowat,
  'pricePerAmp': instance.pricePerAmp,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'residentialPricePerAmp': instance.residentialPricePerAmp,
  'residentialPricePerKilowat': instance.residentialPricePerKilowat,
  'residentialFixedCharge': instance.residentialFixedCharge,
  'residentialTVA': instance.residentialTVA,
  'commercialPricePerAmp': instance.commercialPricePerAmp,
  'commercialPricePerKilowat': instance.commercialPricePerKilowat,
  'commercialFixedCharge': instance.commercialFixedCharge,
  'commercialTVA': instance.commercialTVA,
  'industrialPricePerAmp': instance.industrialPricePerAmp,
  'industrialPricePerKilowat': instance.industrialPricePerKilowat,
  'industrialFixedCharge': instance.industrialFixedCharge,
  'industrialTVA': instance.industrialTVA,
  'language': instance.language,
  'dueDate': instance.dueDate,
  'triggerDate': instance.triggerDate,
  'triggerMessage': instance.triggerMessage,
};
