// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspend_customers_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuspendCustomersRequest _$SuspendCustomersRequestFromJson(
  Map<String, dynamic> json,
) => _SuspendCustomersRequest(
  customerIds: (json['customerIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SuspendCustomersRequestToJson(
  _SuspendCustomersRequest instance,
) => <String, dynamic>{'customerIds': instance.customerIds};
