// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateInvoiceRequest _$UpdateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateInvoiceRequest(
  consumptionStart: _dateOnlyFromJson(json['consumptionStart'] as String?),
  consumptionEnd: _dateOnlyFromJson(json['consumptionEnd'] as String?),
);

Map<String, dynamic> _$UpdateInvoiceRequestToJson(
  _UpdateInvoiceRequest instance,
) => <String, dynamic>{
  'consumptionStart': _dateOnlyToJson(instance.consumptionStart),
  'consumptionEnd': _dateOnlyToJson(instance.consumptionEnd),
};
