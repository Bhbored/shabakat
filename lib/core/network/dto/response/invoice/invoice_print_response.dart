import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_print_response.freezed.dart';
part 'invoice_print_response.g.dart';

@freezed
sealed class InvoicePrintResponse with _$InvoicePrintResponse {
  const factory InvoicePrintResponse({
    required String companyName,
    String? logoUrl,
    required int invoiceNumber,
    required String customerName,
    String? customerPhone,
    String? customerAddress,
    required String planType,
    required double planValue,
    required double unitPrice,
    required double fixedCharge,
    required double tvaPercent,
    required double tvaAmount,
    required bool showTva,
    double? previousReading,
    String? previousReadingDate,
    double? currentReading,
    String? currentReadingDate,
    double? totalConsumption,
    required double consumptionCost,
    required double subtotalBeforeTva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    required String invoiceStatus,
    required String issueDate,
    required String dueDate,
    required bool isKilowattPlan,
    required bool isFixedKilowattPlan,
  }) = _InvoicePrintResponse;

  factory InvoicePrintResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoicePrintResponseFromJson(json);
}
