import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum AuditEntityType { customer, invoice, payment, expense }

extension AuditEntityTypeX on AuditEntityType {
  String get apiValue => switch (this) {
    AuditEntityType.customer => 'Customer',
    AuditEntityType.invoice => 'Invoice',
    AuditEntityType.payment => 'Payment',
    AuditEntityType.expense => 'Expense',
  };

  String get label => switch (this) {
    AuditEntityType.customer => 'audit.entity_types.customer'.tr(),
    AuditEntityType.invoice => 'audit.entity_types.invoice'.tr(),
    AuditEntityType.payment => 'audit.entity_types.payment'.tr(),
    AuditEntityType.expense => 'audit.entity_types.expense'.tr(),
  };
}

extension StringToAuditEntityType on String {
  AuditEntityType? toAuditEntityTypeOrNull() => switch (this) {
    'Customer' || 'customer' => AuditEntityType.customer,
    'Invoice' || 'invoice' => AuditEntityType.invoice,
    'Payment' || 'payment' => AuditEntityType.payment,
    'Expense' || 'expense' => AuditEntityType.expense,
    _ => null,
  };
}

extension NullableStringToAuditEntityType on String? {
  AuditEntityType? toAuditEntityTypeOrNull() => this?.toAuditEntityTypeOrNull();
}
