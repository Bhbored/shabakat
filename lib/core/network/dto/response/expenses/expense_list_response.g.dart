// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseListResponse _$ExpenseListResponseFromJson(Map<String, dynamic> json) =>
    _ExpenseListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ExpenseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$ExpenseListResponseToJson(
  _ExpenseListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'totalCount': instance.totalCount,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
  'totalPages': instance.totalPages,
  'hasPreviousPage': instance.hasPreviousPage,
  'hasNextPage': instance.hasNextPage,
  'totalAmount': instance.totalAmount,
};
