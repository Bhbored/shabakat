// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceSummaryResponse _$InvoiceSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _InvoiceSummaryResponse(
  id: json['id'] as String,
  customerId: json['customerId'] as String?,
  invoiceNumber: (json['invoiceNumber'] as num).toInt(),
  customerName: json['customerName'] as String,
  invoiceStatus: json['invoiceStatus'] as String,
  consumptionStart: _dateOnlyFromJson(json['consumptionStart'] as String),
  consumptionEnd: _dateOnlyFromJson(json['consumptionEnd'] as String),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num).toDouble(),
  amountDue: (json['amountDue'] as num).toDouble(),
  billedConsumption: (json['billedConsumption'] as num?)?.toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$InvoiceSummaryResponseToJson(
  _InvoiceSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'customerId': instance.customerId,
  'invoiceNumber': instance.invoiceNumber,
  'customerName': instance.customerName,
  'invoiceStatus': instance.invoiceStatus,
  'consumptionStart': _dateOnlyToJson(instance.consumptionStart),
  'consumptionEnd': _dateOnlyToJson(instance.consumptionEnd),
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'amountDue': instance.amountDue,
  'billedConsumption': instance.billedConsumption,
  'createdAt': instance.createdAt.toIso8601String(),
};
