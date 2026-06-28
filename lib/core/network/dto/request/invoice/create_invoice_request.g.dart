// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateInvoiceRequest _$CreateInvoiceRequestFromJson(
  Map<String, dynamic> json,
) => _CreateInvoiceRequest(
  customerId: json['customerId'] as String,
  paymentAmount: (json['paymentAmount'] as num?)?.toDouble(),
  kilowattAmount: (json['kilowattAmount'] as num?)?.toDouble(),
  paymentMethod: $enumDecodeNullable(
    _$PaymentMethodEnumMap,
    json['paymentMethod'],
  ),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateInvoiceRequestToJson(
  _CreateInvoiceRequest instance,
) => <String, dynamic>{
  'customerId': instance.customerId,
  'paymentAmount': instance.paymentAmount,
  'kilowattAmount': instance.kilowattAmount,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod],
  'notes': instance.notes,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.wish: 'wish',
};
