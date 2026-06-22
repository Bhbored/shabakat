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
  expenseType: $enumDecodeNullable(_$ExpenseTypeEnumMap, json['expenseType']),
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$ExpenseFilterRequestToJson(
  _ExpenseFilterRequest instance,
) => <String, dynamic>{
  'dateFrom': _dateOnlyToJson(instance.dateFrom),
  'dateTo': _dateOnlyToJson(instance.dateTo),
  'expenseType': _$ExpenseTypeEnumMap[instance.expenseType],
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};

const _$ExpenseTypeEnumMap = {
  ExpenseType.fuel: 'fuel',
  ExpenseType.maintenance: 'maintenance',
  ExpenseType.employees: 'employees',
  ExpenseType.other: 'other',
};
