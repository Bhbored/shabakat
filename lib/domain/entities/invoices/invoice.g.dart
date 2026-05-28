// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invoice _$InvoiceFromJson(Map<String, dynamic> json) => _Invoice(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  companyId: json['companyId'] as String,
  customerId: json['customerId'] as String,
  invoiceNumber: (json['invoiceNumber'] as num).toInt(),
  issueDate: DateTime.parse(json['issueDate'] as String),
  dueDate: DateTime.parse(json['dueDate'] as String),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tva: (json['tva'] as num).toDouble(),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num).toDouble(),
  amountDue: (json['amountDue'] as num).toDouble(),
  invoiceStatus:
      $enumDecodeNullable(_$InvoiceStatusEnumMap, json['invoiceStatus']) ??
      InvoiceStatus.unpaid,
);

Map<String, dynamic> _$InvoiceToJson(_Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'companyId': instance.companyId,
  'customerId': instance.customerId,
  'invoiceNumber': instance.invoiceNumber,
  'issueDate': instance.issueDate.toIso8601String(),
  'dueDate': instance.dueDate.toIso8601String(),
  'fixedCharge': instance.fixedCharge,
  'tva': instance.tva,
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'amountDue': instance.amountDue,
  'invoiceStatus': _$InvoiceStatusEnumMap[instance.invoiceStatus]!,
};

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.unpaid: 'unpaid',
  InvoiceStatus.partiallypaid: 'partiallypaid',
  InvoiceStatus.paid: 'paid',
};
