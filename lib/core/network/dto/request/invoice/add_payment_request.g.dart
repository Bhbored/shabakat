// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddPaymentRequest _$AddPaymentRequestFromJson(Map<String, dynamic> json) =>
    _AddPaymentRequest(
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddPaymentRequestToJson(_AddPaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'notes': instance.notes,
    };
