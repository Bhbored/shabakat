import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_skipped_response.freezed.dart';
part 'invoice_skipped_response.g.dart';

@freezed
sealed class InvoiceSkippedResponse with _$InvoiceSkippedResponse {
  const factory InvoiceSkippedResponse({
    required String customerId,
    required String customerName,
    required String reason,
    required DateTime skippedAt,
  }) = _InvoiceSkippedResponse;

  factory InvoiceSkippedResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSkippedResponseFromJson(json);
}
