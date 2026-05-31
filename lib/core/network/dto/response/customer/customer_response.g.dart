// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    _CustomerResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      customerType: json['customerType'] as String,
      plan: json['plan'] as String,
      planValue: (json['planValue'] as num).toDouble(),
      customerStatus: json['customerStatus'] as String,
      subscriptionDate: _dateOnlyFromJson(json['subscriptionDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      customerRelation: json['customerRelation'] as String?,
      hasPricingOverride: json['hasPricingOverride'] as bool,
      pricingOverride: json['pricingOverride'] == null
          ? null
          : CustomerPricingOverrideDto.fromJson(
              json['pricingOverride'] as Map<String, dynamic>,
            ),
      totalBilled: (json['totalBilled'] as num).toDouble(),
      totalPaid: (json['totalPaid'] as num).toDouble(),
      totalOutstanding: (json['totalOutstanding'] as num).toDouble(),
      paidThisMonth: json['paidThisMonth'] as bool,
    );

Map<String, dynamic> _$CustomerResponseToJson(_CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'customerType': instance.customerType,
      'plan': instance.plan,
      'planValue': instance.planValue,
      'customerStatus': instance.customerStatus,
      'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
      'createdAt': instance.createdAt.toIso8601String(),
      'customerRelation': instance.customerRelation,
      'hasPricingOverride': instance.hasPricingOverride,
      'pricingOverride': instance.pricingOverride,
      'totalBilled': instance.totalBilled,
      'totalPaid': instance.totalPaid,
      'totalOutstanding': instance.totalOutstanding,
      'paidThisMonth': instance.paidThisMonth,
    };
