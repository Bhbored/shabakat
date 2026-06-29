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
