// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddPaymentRequest _$AddPaymentRequestFromJson(Map<String, dynamic> json) =>
    _AddPaymentRequest(
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddPaymentRequestToJson(_AddPaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'notes': instance.notes,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.wish: 'wish',
};
