import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons/lucide_icons.dart';

@JsonEnum(alwaysCreate: true)
enum AuditAction {
  customerCreated,
  customerUpdated,
  customerDeleted,
  invoiceCreated,
  invoiceBulkCreated,
  invoicePaymentRecorded,
  invoiceFixedKilowattCharge,
  expenseCreated,
  expenseUpdated,
  expenseDeleted,
}

extension AuditActionX on AuditAction {
  String get label => switch (this) {
    AuditAction.customerCreated => 'audit.actions.customer_created'.tr(),
    AuditAction.customerUpdated => 'audit.actions.customer_updated'.tr(),
    AuditAction.customerDeleted => 'audit.actions.customer_deleted'.tr(),
    AuditAction.invoiceCreated => 'audit.actions.invoice_created'.tr(),
    AuditAction.invoiceBulkCreated => 'audit.actions.invoice_bulk_created'.tr(),
    AuditAction.invoicePaymentRecorded =>
      'audit.actions.invoice_payment_recorded'.tr(),
    AuditAction.invoiceFixedKilowattCharge =>
      'audit.actions.invoice_fixed_kilowatt_charge'.tr(),
    AuditAction.expenseCreated => 'audit.actions.expense_created'.tr(),
    AuditAction.expenseUpdated => 'audit.actions.expense_updated'.tr(),
    AuditAction.expenseDeleted => 'audit.actions.expense_deleted'.tr(),
  };

  IconData get icon => switch (this) {
    AuditAction.customerCreated ||
    AuditAction.customerUpdated ||
    AuditAction.customerDeleted => LucideIcons.users,
    AuditAction.invoiceCreated ||
    AuditAction.invoiceBulkCreated ||
    AuditAction.invoicePaymentRecorded ||
    AuditAction.invoiceFixedKilowattCharge => LucideIcons.fileText,
    AuditAction.expenseCreated ||
    AuditAction.expenseUpdated ||
    AuditAction.expenseDeleted => LucideIcons.receipt,
  };
}

extension StringToAuditAction on String {
  AuditAction toAuditAction() => switch (this) {
    'customerCreated' || 'CustomerCreated' => AuditAction.customerCreated,
    'customerUpdated' || 'CustomerUpdated' => AuditAction.customerUpdated,
    'customerDeleted' || 'CustomerDeleted' => AuditAction.customerDeleted,
    'invoiceCreated' || 'InvoiceCreated' => AuditAction.invoiceCreated,
    'invoiceBulkCreated' || 'InvoiceBulkCreated' =>
      AuditAction.invoiceBulkCreated,
    'invoicePaymentRecorded' || 'InvoicePaymentRecorded' =>
      AuditAction.invoicePaymentRecorded,
    'invoiceFixedKilowattCharge' || 'InvoiceFixedKilowattCharge' =>
      AuditAction.invoiceFixedKilowattCharge,
    'expenseCreated' || 'ExpenseCreated' => AuditAction.expenseCreated,
    'expenseUpdated' || 'ExpenseUpdated' => AuditAction.expenseUpdated,
    'expenseDeleted' || 'ExpenseDeleted' => AuditAction.expenseDeleted,
    _ => AuditAction.customerCreated,
  };
}
