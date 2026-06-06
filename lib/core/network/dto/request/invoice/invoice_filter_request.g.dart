// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceFilterRequest _$InvoiceFilterRequestFromJson(
  Map<String, dynamic> json,
) => _InvoiceFilterRequest(
  customerId: json['customerId'] as String?,
  invoiceStatus: json['invoiceStatus'] as String?,
  issueDateFrom: _dateOnlyFromJson(json['issueDateFrom'] as String?),
  issueDateTo: _dateOnlyFromJson(json['issueDateTo'] as String?),
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$InvoiceFilterRequestToJson(
  _InvoiceFilterRequest instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'invoiceStatus': instance.invoiceStatus,
  'issueDateFrom': _dateOnlyToJson(instance.issueDateFrom),
  'issueDateTo': _dateOnlyToJson(instance.issueDateTo),
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
};
