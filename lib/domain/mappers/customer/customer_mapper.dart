import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_response.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_summary_response.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_with_invoices_response.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';

extension CustomerResponseMapper on CustomerResponse {
  Customer toEntity() => Customer(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    name: name,
    phone: phone,
    address: address,
    areaName: areaName,
    areaId: null,
    customerType: toCustomerType(customerType),
    customerRelation: toCustomerRelation(customerRelation),
    subscriptionDate: subscriptionDate,
    priceOverride: hasPricingOverride ? pricingOverride?.price : null,
    fixedChargeOverride: hasPricingOverride ? pricingOverride?.fixedCharge : null,
    tvaOverride: hasPricingOverride ? pricingOverride?.tva : null,
    hasPricingOverride: hasPricingOverride,
    customerStatus: toCustomerStatus(customerStatus),
    plan: plan.toPlanType(),
    planValue: planValue,
    totalBilled: totalBilled,
    totalPaid: totalPaid,
    totalOutstanding: totalOutstanding,
  );
}

CustomerRelation? toCustomerRelation(String? value) =>
    switch (value?.toLowerCase()) {
      'friend' => CustomerRelation.friend,
      'family' => CustomerRelation.family,
      'owner' => CustomerRelation.owner,
      _ => null,
    };
CustomerStatus toCustomerStatus(String value) => switch (value.toLowerCase()) {
  'active' => CustomerStatus.active,
  'suspended' => CustomerStatus.suspended,
  'terminated' => CustomerStatus.terminated,
  _ => CustomerStatus.active,
};
CustomerType toCustomerType(String value) => switch (value.toLowerCase()) {
  'residential' => CustomerType.residential,
  'commercial' => CustomerType.commercial,
  'industrial' => CustomerType.industrial,
  _ => CustomerType.residential,
};

extension CustomerSummaryResponseMapper on CustomerSummaryResponse {
  Customer toEntity() => Customer(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    name: name,
    phone: phone,
    address: address,
    areaName: areaName,
    areaId: null,
    customerType: toCustomerType(customerType),
    customerRelation: toCustomerRelation(customerRelation),
    subscriptionDate: subscriptionDate,
    priceOverride: null,
    fixedChargeOverride: null,
    tvaOverride: null,
    hasPricingOverride: hasPricingOverride,
    customerStatus: toCustomerStatus(customerStatus),
    plan: plan.toPlanType(),
    planValue: planValue,
    totalOutstanding: amountDue,
  );
}

extension CustomerWithInvoicesResponseMapper on CustomerWithInvoicesResponse {
  Customer toEntity() => Customer(
    id: id,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    companyId: '',
    name: name,
    phone: phone,
    address: address,
    areaId: null,
    customerType: toCustomerType(customerType),
    customerRelation: null,
    subscriptionDate: subscriptionDate,
    priceOverride: null,
    fixedChargeOverride: null,
    tvaOverride: null,
    customerStatus: toCustomerStatus(customerStatus),
    plan: plan.toPlanType(),
    planValue: planValue,
    totalBilled: totalBilled,
    totalPaid: totalPaid,
    totalOutstanding: totalOutstanding,
    invoices: invoices.map((i) => i.toEntity()).toList(),
  );
}
