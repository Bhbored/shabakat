// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_create_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BulkCreateInvoiceResponse _$BulkCreateInvoiceResponseFromJson(
  Map<String, dynamic> json,
) => _BulkCreateInvoiceResponse(
  created: (json['created'] as num).toInt(),
  skipped: (json['skipped'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$BulkCreateInvoiceResponseToJson(
  _BulkCreateInvoiceResponse instance,
) => <String, dynamic>{
  'created': instance.created,
  'skipped': instance.skipped,
  'message': instance.message,
};
