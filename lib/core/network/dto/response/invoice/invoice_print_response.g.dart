// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_print_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoicePrintResponse _$InvoicePrintResponseFromJson(
  Map<String, dynamic> json,
) => _InvoicePrintResponse(
  companyName: json['companyName'] as String,
  logoUrl: json['logoUrl'] as String?,
  invoiceNumber: (json['invoiceNumber'] as num).toInt(),
  customerName: json['customerName'] as String,
  customerPhone: json['customerPhone'] as String?,
  customerAddress: json['customerAddress'] as String?,
  planType: json['planType'] as String,
  planValue: (json['planValue'] as num).toDouble(),
  unitPrice: (json['unitPrice'] as num).toDouble(),
  fixedCharge: (json['fixedCharge'] as num).toDouble(),
  tvaPercent: (json['tvaPercent'] as num).toDouble(),
  tvaAmount: (json['tvaAmount'] as num).toDouble(),
  showTva: json['showTva'] as bool,
  previousReading: (json['previousReading'] as num?)?.toDouble(),
  previousReadingDate: json['previousReadingDate'] as String?,
  currentReading: (json['currentReading'] as num?)?.toDouble(),
  currentReadingDate: json['currentReadingDate'] as String?,
  totalConsumption: (json['totalConsumption'] as num?)?.toDouble(),
  consumptionCost: (json['consumptionCost'] as num).toDouble(),
  subtotalBeforeTva: (json['subtotalBeforeTva'] as num).toDouble(),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  paidAmount: (json['paidAmount'] as num).toDouble(),
  amountDue: (json['amountDue'] as num).toDouble(),
  invoiceStatus: json['invoiceStatus'] as String,
  issueDate: json['issueDate'] as String,
  dueDate: json['dueDate'] as String,
  isKilowattPlan: json['isKilowattPlan'] as bool,
  isFixedKilowattPlan: json['isFixedKilowattPlan'] as bool,
);

Map<String, dynamic> _$InvoicePrintResponseToJson(
  _InvoicePrintResponse instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'logoUrl': instance.logoUrl,
  'invoiceNumber': instance.invoiceNumber,
  'customerName': instance.customerName,
  'customerPhone': instance.customerPhone,
  'customerAddress': instance.customerAddress,
  'planType': instance.planType,
  'planValue': instance.planValue,
  'unitPrice': instance.unitPrice,
  'fixedCharge': instance.fixedCharge,
  'tvaPercent': instance.tvaPercent,
  'tvaAmount': instance.tvaAmount,
  'showTva': instance.showTva,
  'previousReading': instance.previousReading,
  'previousReadingDate': instance.previousReadingDate,
  'currentReading': instance.currentReading,
  'currentReadingDate': instance.currentReadingDate,
  'totalConsumption': instance.totalConsumption,
  'consumptionCost': instance.consumptionCost,
  'subtotalBeforeTva': instance.subtotalBeforeTva,
  'totalAmount': instance.totalAmount,
  'paidAmount': instance.paidAmount,
  'amountDue': instance.amountDue,
  'invoiceStatus': instance.invoiceStatus,
  'issueDate': instance.issueDate,
  'dueDate': instance.dueDate,
  'isKilowattPlan': instance.isKilowattPlan,
  'isFixedKilowattPlan': instance.isFixedKilowattPlan,
};
