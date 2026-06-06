// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseFilterRequest _$ExpenseFilterRequestFromJson(
  Map<String, dynamic> json,
) => _ExpenseFilterRequest(
  dateFrom: _dateOnlyFromJson(json['dateFrom'] as String?),
  dateTo: _dateOnlyFromJson(json['dateTo'] as String?),
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$ExpenseFilterRequestToJson(
  _ExpenseFilterRequest instance,
) => <String, dynamic>{
  'dateFrom': _dateOnlyToJson(instance.dateFrom),
  'dateTo': _dateOnlyToJson(instance.dateTo),
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};
