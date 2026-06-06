// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateCustomerRequest _$UpdateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCustomerRequest(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  areaId: json['areaId'] as String?,
  customerType: json['customerType'] as String?,
  plan: json['plan'] as String?,
  planValue: (json['planValue'] as num?)?.toDouble(),
  customerStatus: json['customerStatus'] as String?,
  customerRelation: json['customerRelation'] as String?,
  pricingOverride: json['pricingOverride'] == null
      ? null
      : CustomerPricingOverrideDto.fromJson(
          json['pricingOverride'] as Map<String, dynamic>,
        ),
  clearPricingOverride: json['clearPricingOverride'] as bool? ?? false,
);

Map<String, dynamic> _$UpdateCustomerRequestToJson(
  _UpdateCustomerRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'areaId': instance.areaId,
  'customerType': instance.customerType,
  'plan': instance.plan,
  'planValue': instance.planValue,
  'customerStatus': instance.customerStatus,
  'customerRelation': instance.customerRelation,
  'pricingOverride': instance.pricingOverride,
  'clearPricingOverride': instance.clearPricingOverride,
};
