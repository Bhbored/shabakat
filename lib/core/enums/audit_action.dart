import 'package:freezed_annotation/freezed_annotation.dart';

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
