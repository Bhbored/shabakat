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
  residentialPricePerAmp: (json['residentialPricePerAmp'] as num).toDouble(),
  residentialPricePerKilowat: (json['residentialPricePerKilowat'] as num)
      .toDouble(),
  residentialFixedCharge: (json['residentialFixedCharge'] as num).toDouble(),
  residentialTVA: (json['residentialTVA'] as num).toDouble(),
  commercialPricePerAmp: (json['commercialPricePerAmp'] as num).toDouble(),
  commercialPricePerKilowat: (json['commercialPricePerKilowat'] as num)
      .toDouble(),
  commercialFixedCharge: (json['commercialFixedCharge'] as num).toDouble(),
  commercialTVA: (json['commercialTVA'] as num).toDouble(),
  industrialPricePerAmp: (json['industrialPricePerAmp'] as num).toDouble(),
  industrialPricePerKilowat: (json['industrialPricePerKilowat'] as num)
      .toDouble(),
  industrialFixedCharge: (json['industrialFixedCharge'] as num).toDouble(),
  industrialTVA: (json['industrialTVA'] as num).toDouble(),
  language: json['language'] as String,
  dueDate: (json['dueDate'] as num).toInt(),
  triggerDate: (json['triggerDate'] as num).toInt(),
  triggerMessage: json['triggerMessage'] as String?,
  ampereSchedulePricingEnabled: json['ampereSchedulePricingEnabled'] as bool,
);

Map<String, dynamic> _$UpdatePreferencesRequestToJson(
  _UpdatePreferencesRequest instance,
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
  'ampereSchedulePricingEnabled': instance.ampereSchedulePricingEnabled,
};
