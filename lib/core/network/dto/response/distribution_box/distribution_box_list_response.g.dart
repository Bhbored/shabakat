// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistributionBoxListResponse _$DistributionBoxListResponseFromJson(
  Map<String, dynamic> json,
) => _DistributionBoxListResponse(
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => DistributionBoxResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
  hasPreviousPage: json['hasPreviousPage'] as bool? ?? false,
  hasNextPage: json['hasNextPage'] as bool? ?? false,
);

Map<String, dynamic> _$DistributionBoxListResponseToJson(
  _DistributionBoxListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'totalCount': instance.totalCount,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
  'totalPages': instance.totalPages,
  'hasPreviousPage': instance.hasPreviousPage,
  'hasNextPage': instance.hasNextPage,
};
