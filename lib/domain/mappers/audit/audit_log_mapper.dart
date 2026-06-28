import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/network/dto/response/audit/audit_log_response.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';

extension AuditLogResponseMapper on AuditLogResponse {
  AuditLog toEntity() => AuditLog(
    id: id,
    action: toAuditAction(action),
    status: toAuditLogStatus(status),
    summary: summary,
    entityType: entityType,
    entityId: entityId,
    details: details,
    userEmail: userEmail,
    createdAt: createdAt,
  );
}

AuditAction toAuditAction(String value) => switch (value) {
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

AuditLogStatus toAuditLogStatus(String value) => switch (value.toLowerCase()) {
  'success' => AuditLogStatus.success,
  'failed' => AuditLogStatus.failed,
  _ => AuditLogStatus.failed,
};
