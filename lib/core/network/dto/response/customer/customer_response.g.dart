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
      building: json['building'] as String?,
      floor: json['floor'] as String?,
      cableName: json['cableName'] as String?,
      boxId: json['boxId'] as String?,
      boxName: json['boxName'] as String?,
      ampereScheduleId: json['ampereScheduleId'] as String?,
      ampereScheduleName: json['ampereScheduleName'] as String?,
      customerType: json['customerType'] as String,
      plan: json['plan'] as String,
      planValue: (json['planValue'] as num).toDouble(),
      initialMeterReading: (json['initialMeterReading'] as num?)?.toDouble(),
      areaName: json['areaName'] as String?,
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
      totalBilled: (json['totalBilled'] as num?)?.toDouble() ?? 0.0,
      totalPaid: (json['totalPaid'] as num?)?.toDouble() ?? 0.0,
      totalOutstanding: (json['totalOutstanding'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CustomerResponseToJson(_CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'building': instance.building,
      'floor': instance.floor,
      'cableName': instance.cableName,
      'boxId': instance.boxId,
      'boxName': instance.boxName,
      'ampereScheduleId': instance.ampereScheduleId,
      'ampereScheduleName': instance.ampereScheduleName,
      'customerType': instance.customerType,
      'plan': instance.plan,
      'planValue': instance.planValue,
      'initialMeterReading': instance.initialMeterReading,
      'areaName': instance.areaName,
      'customerStatus': instance.customerStatus,
      'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
      'createdAt': instance.createdAt.toIso8601String(),
      'customerRelation': instance.customerRelation,
      'hasPricingOverride': instance.hasPricingOverride,
      'pricingOverride': instance.pricingOverride,
      'totalBilled': instance.totalBilled,
      'totalPaid': instance.totalPaid,
      'totalOutstanding': instance.totalOutstanding,
    };
