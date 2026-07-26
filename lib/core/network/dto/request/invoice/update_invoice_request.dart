import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_invoice_request.freezed.dart';
part 'update_invoice_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class UpdateInvoiceRequest with _$UpdateInvoiceRequest {
  const factory UpdateInvoiceRequest({
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? consumptionStart,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? consumptionEnd,
  }) = _UpdateInvoiceRequest;

  factory UpdateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceRequestFromJson(json);
}
