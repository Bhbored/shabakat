import 'package:freezed_annotation/freezed_annotation.dart';

import 'invoice_summary_response.dart';

part 'list_invoice_summery_response.freezed.dart';
part 'list_invoice_summery_response.g.dart';

@freezed
sealed class ListInvoiceSummeryResponse with _$ListInvoiceSummeryResponse {
  const factory ListInvoiceSummeryResponse({
    @Default([]) List<InvoiceSummaryResponse> data,
    @Default(0) int totalCount,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
    @Default(0) int totalPages,
    @Default(false) bool hasPreviousPage,
    @Default(false) bool hasNextPage,
  }) = _ListInvoiceSummeryResponse;
  factory ListInvoiceSummeryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInvoiceSummeryResponseFromJson(json);
}
