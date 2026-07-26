// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceFilterRequest _$InvoiceFilterRequestFromJson(
  Map<String, dynamic> json,
) => _InvoiceFilterRequest(
  customerId: json['customerId'] as String?,
  invoiceStatus: $enumDecodeNullable(
    _$InvoiceStatusEnumMap,
    json['invoiceStatus'],
  ),
  consumptionStartFrom: _dateOnlyFromJson(
    json['consumptionStartFrom'] as String?,
  ),
  consumptionStartTo: _dateOnlyFromJson(json['consumptionStartTo'] as String?),
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$InvoiceFilterRequestToJson(
  _InvoiceFilterRequest instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'invoiceStatus': _$InvoiceStatusEnumMap[instance.invoiceStatus],
  'consumptionStartFrom': _dateOnlyToJson(instance.consumptionStartFrom),
  'consumptionStartTo': _dateOnlyToJson(instance.consumptionStartTo),
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.unpaid: 'unpaid',
  InvoiceStatus.partiallypaid: 'partiallypaid',
  InvoiceStatus.paid: 'paid',
};
