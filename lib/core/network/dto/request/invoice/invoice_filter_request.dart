import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'invoice_filter_request.freezed.dart';
part 'invoice_filter_request.g.dart';

String? _dateOnlyToJson(DateTime? date) => date != null
    ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
    : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class InvoiceFilterRequest with _$InvoiceFilterRequest {
  const factory InvoiceFilterRequest({
    String? customerId,
    InvoiceStatus? invoiceStatus,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? issueDateFrom,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? issueDateTo,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
  }) = _InvoiceFilterRequest;

  factory InvoiceFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFilterRequestFromJson(json);
}
