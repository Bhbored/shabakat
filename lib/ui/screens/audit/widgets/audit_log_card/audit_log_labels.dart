import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/app_colors.dart';

class AuditLogLabels {
  static String actionLabel(AuditAction action) => switch (action) {
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

  static String statusLabel(AuditLogStatus status) => switch (status) {
    AuditLogStatus.success => 'audit.status.success'.tr(),
    AuditLogStatus.failed => 'audit.status.failed'.tr(),
  };

  static String? entityTypeLabel(AuditEntityType? entityType) =>
      entityType == null
      ? null
      : switch (entityType) {
          AuditEntityType.customer => 'audit.entity_types.customer'.tr(),
          AuditEntityType.invoice => 'audit.entity_types.invoice'.tr(),
          AuditEntityType.payment => 'audit.entity_types.payment'.tr(),
          AuditEntityType.expense => 'audit.entity_types.expense'.tr(),
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
