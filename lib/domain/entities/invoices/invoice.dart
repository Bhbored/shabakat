import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
sealed class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String companyId,
    required String customerId,
    String? customerName,
    String? customerPhone,
    required int invoiceNumber,
    required DateTime issueDate,
    required DateTime dueDate,
    required double fixedCharge,
    required double tva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    double? billedConsumption,
    @Default(InvoiceStatus.unpaid) InvoiceStatus invoiceStatus,
    List<Payment>? payments,
  }) = _Invoice;

  factory Invoice.empty() => Invoice(
    id: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    companyId: '',
    customerId: '',
    invoiceNumber: 0,
    issueDate: DateTime.now(),
    dueDate: DateTime.now(),
    fixedCharge: 0,
    tva: 0,
    totalAmount: 0,
    paidAmount: 0,
    amountDue: 0,
    invoiceStatus: InvoiceStatus.unpaid,
  );

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
