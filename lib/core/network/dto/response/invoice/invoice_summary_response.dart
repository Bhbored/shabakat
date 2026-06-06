import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_summary_response.freezed.dart';
part 'invoice_summary_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class InvoiceSummaryResponse with _$InvoiceSummaryResponse {
  const factory InvoiceSummaryResponse({
    required String id,
    required int invoiceNumber,
    required String customerName,
    required String invoiceStatus,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime issueDate,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime dueDate,
    required double totalAmount,
    required double paidAmount,
    required double amountDue,
    required DateTime createdAt,
  }) = _InvoiceSummaryResponse;

  factory InvoiceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSummaryResponseFromJson(json);
}
