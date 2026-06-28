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
