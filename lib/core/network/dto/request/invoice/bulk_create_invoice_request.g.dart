// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_create_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BulkCreateInvoiceRequest _$BulkCreateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => _BulkCreateInvoiceRequest(
  dueDate: _dateOnlyFromJson(json['dueDate'] as String),
  issueDate: _dateOnlyNullableFromJson(json['issueDate'] as String?),
);

Map<String, dynamic> _$BulkCreateInvoiceRequestToJson(
  _BulkCreateInvoiceRequest instance,
) => <String, dynamic>{
  'dueDate': _dateOnlyToJson(instance.dueDate),
  'issueDate': _dateOnlyNullableToJson(instance.issueDate),
};
