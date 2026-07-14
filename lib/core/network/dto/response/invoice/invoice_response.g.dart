// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    _InvoiceResponse(
      id: json['id'] as String,
      invoiceNumber: (json['invoiceNumber'] as num).toInt(),
      customerId: json['customerId'] as String? ?? '',
      customerName: json['customerName'] as String,
      issueDate: _dateOnlyFromJson(json['issueDate'] as String),
      dueDate: _dateOnlyFromJson(json['dueDate'] as String),
      fixedCharge: (json['fixedCharge'] as num).toDouble(),
      tva: (json['tva'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      amountDue: (json['amountDue'] as num).toDouble(),
      billedConsumption: (json['billedConsumption'] as num?)?.toDouble(),
      invoiceStatus: json['invoiceStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceResponseToJson(_InvoiceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'issueDate': _dateOnlyToJson(instance.issueDate),
      'dueDate': _dateOnlyToJson(instance.dueDate),
      'fixedCharge': instance.fixedCharge,
      'tva': instance.tva,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'amountDue': instance.amountDue,
      'billedConsumption': instance.billedConsumption,
      'invoiceStatus': instance.invoiceStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'payments': instance.payments,
    };
