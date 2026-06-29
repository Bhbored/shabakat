// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_kilowatt_calculate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FixedKilowattCalculateResponse _$FixedKilowattCalculateResponseFromJson(
  Map<String, dynamic> json,
) => _FixedKilowattCalculateResponse(
  paymentAmount: (json['paymentAmount'] as num).toDouble(),
  kilowattAmount: (json['kilowattAmount'] as num).toDouble(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  planValue: (json['planValue'] as num).toDouble(),
  customerType: json['customerType'] as String,
);

Map<String, dynamic> _$FixedKilowattCalculateResponseToJson(
  _FixedKilowattCalculateResponse instance,
) => <String, dynamic>{
  'paymentAmount': instance.paymentAmount,
  'kilowattAmount': instance.kilowattAmount,
  'unitPrice': instance.unitPrice,
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'planValue': instance.planValue,
  'customerType': instance.customerType,
};
