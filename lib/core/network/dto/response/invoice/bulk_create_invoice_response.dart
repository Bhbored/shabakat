import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_create_invoice_response.freezed.dart';
part 'bulk_create_invoice_response.g.dart';

@freezed
sealed class BulkCreateInvoiceResponse with _$BulkCreateInvoiceResponse {
  const factory BulkCreateInvoiceResponse({
    required int created,
    required int skipped,
    required String message,
  }) = _BulkCreateInvoiceResponse;

  factory BulkCreateInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$BulkCreateInvoiceResponseFromJson(json);
}
