// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    _InvoiceResponse(
      id: json['id'] as String,
      invoiceNumber: (json['invoiceNumber'] as num).toInt(),
      customerName: json['customerName'] as String,
      consumptionStart: _dateOnlyFromJson(json['consumptionStart'] as String),
      consumptionEnd: _dateOnlyFromJson(json['consumptionEnd'] as String),
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
      'customerName': instance.customerName,
      'consumptionStart': _dateOnlyToJson(instance.consumptionStart),
      'consumptionEnd': _dateOnlyToJson(instance.consumptionEnd),
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
