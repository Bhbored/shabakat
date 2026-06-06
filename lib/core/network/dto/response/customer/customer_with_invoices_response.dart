import 'package:freezed_annotation/freezed_annotation.dart';

import '../invoice/invoice_response.dart';

part 'customer_with_invoices_response.freezed.dart';
part 'customer_with_invoices_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class CustomerWithInvoicesResponse with _$CustomerWithInvoicesResponse {
  const factory CustomerWithInvoicesResponse({
    required String id,
    required String name,
    String? phone,
    String? address,
    required String customerType,
    required String plan,
    required double planValue,
    required String customerStatus,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime subscriptionDate,
    required double totalBilled,
    required double totalPaid,
    required double totalOutstanding,
    required bool paidThisMonth,
    required List<InvoiceResponse> invoices,
  }) = _CustomerWithInvoicesResponse;

  factory CustomerWithInvoicesResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerWithInvoicesResponseFromJson(json);
}
