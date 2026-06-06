// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_with_invoices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerWithInvoicesResponse _$CustomerWithInvoicesResponseFromJson(
  Map<String, dynamic> json,
) => _CustomerWithInvoicesResponse(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  customerType: json['customerType'] as String,
  plan: json['plan'] as String,
  planValue: (json['planValue'] as num).toDouble(),
  customerStatus: json['customerStatus'] as String,
  subscriptionDate: _dateOnlyFromJson(json['subscriptionDate'] as String),
  totalBilled: (json['totalBilled'] as num).toDouble(),
  totalPaid: (json['totalPaid'] as num).toDouble(),
  totalOutstanding: (json['totalOutstanding'] as num).toDouble(),
  paidThisMonth: json['paidThisMonth'] as bool,
  invoices: (json['invoices'] as List<dynamic>)
      .map((e) => InvoiceResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CustomerWithInvoicesResponseToJson(
  _CustomerWithInvoicesResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'address': instance.address,
  'customerType': instance.customerType,
  'plan': instance.plan,
  'planValue': instance.planValue,
  'customerStatus': instance.customerStatus,
  'subscriptionDate': _dateOnlyToJson(instance.subscriptionDate),
  'totalBilled': instance.totalBilled,
  'totalPaid': instance.totalPaid,
  'totalOutstanding': instance.totalOutstanding,
  'paidThisMonth': instance.paidThisMonth,
  'invoices': instance.invoices,
};
