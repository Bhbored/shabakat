import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_response.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_summary_response.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_with_invoices_response.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension CustomerResponseMapper on CustomerResponse {
  Customer toEntity() => Customer(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    name: name,
    phone: phone,
    address: address,
    building: building,
    floor: floor,
    cableName: cableName,
    boxId: boxId,
    boxName: boxName,
    ampereScheduleId: ampereScheduleId,
    ampereScheduleName: ampereScheduleName,
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
    initialMeterReading: initialMeterReading,
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
    building: building,
    floor: floor,
    cableName: cableName,
    boxId: boxId,
    boxName: boxName,
    ampereScheduleId: ampereScheduleId,
    ampereScheduleName: ampereScheduleName,
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
    initialMeterReading: null,
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
    initialMeterReading: null,
    totalBilled: totalBilled,
    totalPaid: totalPaid,
    totalOutstanding: totalOutstanding,
    invoices: invoices.map((i) => i.toEntity()).toList(),
  );
}

extension CustomerEntityMapper on Customer {
  drift.CustomersCompanion toCompanion() => drift.CustomersCompanion(
    id: Value(id),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
    name: Value(name),
    totalBilled: Value(totalBilled),
    totalPaid: Value(totalPaid),
    totalOutstanding: Value(totalOutstanding),
    phone: Value(phone),
    address: Value(address),
    building: Value(building),
    floor: Value(floor),
    cableName: Value(cableName),
    boxId: Value(boxId),
    boxName: Value(boxName),
    ampereScheduleId: Value(ampereScheduleId),
    ampereScheduleName: Value(ampereScheduleName),
    areaName: Value(areaName),
    areaId: Value(areaId),
    customerType: Value(customerType.name),
    customerRelation: Value(customerRelation?.name),
    subscriptionDate: Value(subscriptionDate),
    priceOverride: Value(priceOverride),
    fixedChargeOverride: Value(fixedChargeOverride),
    tvaOverride: Value(tvaOverride),
    hasPricingOverride: Value(hasPricingOverride),
    customerStatus: Value(customerStatus.name),
    plan: Value(plan.name),
    planValue: Value(planValue),
  );
}

extension CustomerDriftMapper on drift.Customer {
  Customer toEntity() => Customer(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    name: name,
    totalBilled: totalBilled,
    totalPaid: totalPaid,
    totalOutstanding: totalOutstanding,
    phone: phone,
    address: address,
    building: building,
    floor: floor,
    cableName: cableName,
    boxId: boxId,
    boxName: boxName,
    ampereScheduleId: ampereScheduleId,
    ampereScheduleName: ampereScheduleName,
    areaName: areaName,
    areaId: areaId,
    customerType: toCustomerType(customerType),
    customerRelation: toCustomerRelation(customerRelation),
    subscriptionDate: subscriptionDate,
    priceOverride: priceOverride,
    fixedChargeOverride: fixedChargeOverride,
    tvaOverride: tvaOverride,
    hasPricingOverride: hasPricingOverride,
    customerStatus: toCustomerStatus(customerStatus),
    plan: plan.toPlanType(),
    planValue: planValue,
    initialMeterReading: null,
  );
}
