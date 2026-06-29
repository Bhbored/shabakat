// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_kilowatt_calculate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FixedKilowattCalculateRequest _$FixedKilowattCalculateRequestFromJson(
  Map<String, dynamic> json,
) => _FixedKilowattCalculateRequest(
  customerType: $enumDecode(_$CustomerTypeEnumMap, json['customerType']),
  planValue: (json['planValue'] as num).toDouble(),
  paymentAmount: (json['paymentAmount'] as num?)?.toDouble(),
  kilowattAmount: (json['kilowattAmount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$FixedKilowattCalculateRequestToJson(
  _FixedKilowattCalculateRequest instance,
) => <String, dynamic>{
  'customerType': _$CustomerTypeEnumMap[instance.customerType]!,
  'planValue': instance.planValue,
  'paymentAmount': instance.paymentAmount,
  'kilowattAmount': instance.kilowattAmount,
};

const _$CustomerTypeEnumMap = {
  CustomerType.residential: 'residential',
  CustomerType.commercial: 'commercial',
  CustomerType.industrial: 'industrial',
};
