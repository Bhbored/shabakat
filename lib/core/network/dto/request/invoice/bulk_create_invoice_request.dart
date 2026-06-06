import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_create_invoice_request.freezed.dart';
part 'bulk_create_invoice_request.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

String? _dateOnlyNullableToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyNullableFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class BulkCreateInvoiceRequest with _$BulkCreateInvoiceRequest {
  const factory BulkCreateInvoiceRequest({
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime dueDate,
    @JsonKey(toJson: _dateOnlyNullableToJson, fromJson: _dateOnlyNullableFromJson)
    DateTime? issueDate,
  }) = _BulkCreateInvoiceRequest;

  factory BulkCreateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$BulkCreateInvoiceRequestFromJson(json);
}
