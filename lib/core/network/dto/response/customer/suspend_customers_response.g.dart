// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspend_customers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuspendCustomersResponse _$SuspendCustomersResponseFromJson(
  Map<String, dynamic> json,
) => _SuspendCustomersResponse(
  suspended: (json['suspended'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$SuspendCustomersResponseToJson(
  _SuspendCustomersResponse instance,
) => <String, dynamic>{
  'suspended': instance.suspended,
  'message': instance.message,
};
