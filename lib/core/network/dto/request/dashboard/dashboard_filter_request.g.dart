// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardFilterRequest _$DashboardFilterRequestFromJson(
  Map<String, dynamic> json,
) => _DashboardFilterRequest(
  year: (json['year'] as num?)?.toInt(),
  month: (json['month'] as num?)?.toInt(),
);

Map<String, dynamic> _$DashboardFilterRequestToJson(
  _DashboardFilterRequest instance,
) => <String, dynamic>{'year': instance.year, 'month': instance.month};
