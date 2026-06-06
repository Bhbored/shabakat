// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceSummaryResponse _$InvoiceSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _InvoiceSummaryResponse(
  id: json['id'] as String,
  invoiceNumber: (json['invoiceNumber'] as num).toInt(),
  customerName: json['customerName'] as String,
  invoiceStatus: json['invoiceStatus'] as String,
  issueDate: _dateOnlyFromJson(json['issueDate'] as String),
  dueDate: _dateOnlyFromJson(json['dueDate'] as String),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num).toDouble(),
  amountDue: (json['amountDue'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$InvoiceSummaryResponseToJson(
  _InvoiceSummaryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'invoiceNumber': instance.invoiceNumber,
  'customerName': instance.customerName,
  'invoiceStatus': instance.invoiceStatus,
  'issueDate': _dateOnlyToJson(instance.issueDate),
  'dueDate': _dateOnlyToJson(instance.dueDate),
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'amountDue': instance.amountDue,
  'createdAt': instance.createdAt.toIso8601String(),
};
