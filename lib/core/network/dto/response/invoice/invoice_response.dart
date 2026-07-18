import 'package:freezed_annotation/freezed_annotation.dart';

import '../payment/payment_response.dart';

part 'invoice_response.freezed.dart';
part 'invoice_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class InvoiceResponse with _$InvoiceResponse {
  const factory InvoiceResponse({
    required String id,
    required int invoiceNumber,
    required String customerName,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime consumptionStart,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime consumptionEnd,
    required double fixedCharge,
    required double tva,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    double? billedConsumption,
    required String invoiceStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<PaymentResponse> payments,
  }) = _InvoiceResponse;

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);
}
