import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
sealed class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isDeleted,
    required String companyId,
    required String customerId,
    required DateTime issueDate,
    required DateTime dueDate,
    required double fixedCharge,
    required double tva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    @Default(InvoiceStatus.unpaid) InvoiceStatus invoiceStatus,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
