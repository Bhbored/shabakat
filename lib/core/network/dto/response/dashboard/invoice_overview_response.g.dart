// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceOverviewResponse _$InvoiceOverviewResponseFromJson(
  Map<String, dynamic> json,
) => _InvoiceOverviewResponse(
  unpaidCount: (json['unpaidCount'] as num?)?.toInt() ?? 0,
  unpaidTotal: (json['unpaidTotal'] as num?)?.toDouble() ?? 0.0,
  partiallyPaidCount: (json['partiallyPaidCount'] as num?)?.toInt() ?? 0,
  partiallyPaidTotal: (json['partiallyPaidTotal'] as num?)?.toDouble() ?? 0.0,
  paidCount: (json['paidCount'] as num?)?.toInt() ?? 0,
  paidTotal: (json['paidTotal'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$InvoiceOverviewResponseToJson(
  _InvoiceOverviewResponse instance,
) => <String, dynamic>{
  'unpaidCount': instance.unpaidCount,
  'unpaidTotal': instance.unpaidTotal,
  'partiallyPaidCount': instance.partiallyPaidCount,
  'partiallyPaidTotal': instance.partiallyPaidTotal,
  'paidCount': instance.paidCount,
  'paidTotal': instance.paidTotal,
};
