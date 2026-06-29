import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/app_colors.dart';

class AuditLogLabels {
  static String actionLabel(AuditAction action) => switch (action) {
    AuditAction.customerCreated => 'Customer created',
    AuditAction.customerUpdated => 'Customer updated',
    AuditAction.customerDeleted => 'Customer deleted',
    AuditAction.invoiceCreated => 'Invoice created',
    AuditAction.invoiceBulkCreated => 'Invoices bulk created',
    AuditAction.invoicePaymentRecorded => 'Payment recorded',
    AuditAction.invoiceFixedKilowattCharge => 'Fixed kW charge',
    AuditAction.expenseCreated => 'Expense created',
    AuditAction.expenseUpdated => 'Expense updated',
    AuditAction.expenseDeleted => 'Expense deleted',
  };

  static String statusLabel(AuditLogStatus status) => switch (status) {
    AuditLogStatus.success => 'Success',
    AuditLogStatus.failed => 'Failed',
  };

  static String? entityTypeLabel(AuditEntityType? entityType) =>
      entityType == null
      ? null
      : switch (entityType) {
          AuditEntityType.customer => 'Customer',
          AuditEntityType.invoice => 'Invoice',
          AuditEntityType.payment => 'Payment',
          AuditEntityType.expense => 'Expense',
        };

  static IconData statusIcon(AuditLogStatus status) => switch (status) {
    AuditLogStatus.success => LucideIcons.checkCircle2,
    AuditLogStatus.failed => LucideIcons.xCircle,
  };

  static Color statusColor(AuditLogStatus status, ColorScheme colorScheme) =>
      status == AuditLogStatus.success ? AppColors.success : AppColors.error;

  static IconData actionIcon(AuditAction action) => switch (action) {
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
