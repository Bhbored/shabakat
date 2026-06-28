// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_skipped_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceSkippedResponse _$InvoiceSkippedResponseFromJson(
  Map<String, dynamic> json,
) => _InvoiceSkippedResponse(
  customerId: json['customerId'] as String,
  customerName: json['customerName'] as String,
  reason: json['reason'] as String,
  skippedAt: DateTime.parse(json['skippedAt'] as String),
);

Map<String, dynamic> _$InvoiceSkippedResponseToJson(
  _InvoiceSkippedResponse instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'customerName': instance.customerName,
  'reason': instance.reason,
  'skippedAt': instance.skippedAt.toIso8601String(),
};
