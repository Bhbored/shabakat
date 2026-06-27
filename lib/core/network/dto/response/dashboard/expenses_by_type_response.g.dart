// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_by_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpensesByTypeResponse _$ExpensesByTypeResponseFromJson(
  Map<String, dynamic> json,
) => _ExpensesByTypeResponse(
  fuel: (json['fuel'] as num?)?.toDouble() ?? 0.0,
  maintenance: (json['maintenance'] as num?)?.toDouble() ?? 0.0,
  employees: (json['employees'] as num?)?.toDouble() ?? 0.0,
  other: (json['other'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ExpensesByTypeResponseToJson(
  _ExpensesByTypeResponse instance,
) => <String, dynamic>{
  'fuel': instance.fuel,
  'maintenance': instance.maintenance,
  'employees': instance.employees,
  'other': instance.other,
};
