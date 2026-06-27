// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerOverviewResponse _$CustomerOverviewResponseFromJson(
  Map<String, dynamic> json,
) => _CustomerOverviewResponse(
  total: (json['total'] as num?)?.toInt() ?? 0,
  active: (json['active'] as num?)?.toInt() ?? 0,
  suspended: (json['suspended'] as num?)?.toInt() ?? 0,
  terminated: (json['terminated'] as num?)?.toInt() ?? 0,
  ampereCount: (json['ampereCount'] as num?)?.toInt() ?? 0,
  kilowattCount: (json['kilowattCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CustomerOverviewResponseToJson(
  _CustomerOverviewResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'suspended': instance.suspended,
  'terminated': instance.terminated,
  'ampereCount': instance.ampereCount,
  'kilowattCount': instance.kilowattCount,
};
