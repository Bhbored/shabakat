// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_pricing_override_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerPricingOverrideDto _$CustomerPricingOverrideDtoFromJson(
  Map<String, dynamic> json,
) => _CustomerPricingOverrideDto(
  price: (json['price'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
);

Map<String, dynamic> _$CustomerPricingOverrideDtoToJson(
  _CustomerPricingOverrideDto instance,
) => <String, dynamic>{
  'price': instance.price,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
};
