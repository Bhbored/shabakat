// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  companyId: json['companyId'] as String,
  customerId: json['customerId'] as String,
  invoiceId: json['invoiceId'] as String,
  amount: (json['amount'] as num).toDouble(),
  paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
  paymentDate: DateTime.parse(json['paymentDate'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'companyId': instance.companyId,
  'customerId': instance.customerId,
  'invoiceId': instance.invoiceId,
  'amount': instance.amount,
  'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  'paymentDate': instance.paymentDate.toIso8601String(),
  'notes': instance.notes,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.wish: 'wish',
};
