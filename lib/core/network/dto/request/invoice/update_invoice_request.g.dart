// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateInvoiceRequest _$UpdateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateInvoiceRequest(
  issueDate: _dateOnlyFromJson(json['issueDate'] as String?),
  dueDate: _dateOnlyFromJson(json['dueDate'] as String?),
);

Map<String, dynamic> _$UpdateInvoiceRequestToJson(
  _UpdateInvoiceRequest instance,
) => <String, dynamic>{
  'issueDate': _dateOnlyToJson(instance.issueDate),
  'dueDate': _dateOnlyToJson(instance.dueDate),
};
