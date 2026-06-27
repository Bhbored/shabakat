import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_overview_response.freezed.dart';
part 'invoice_overview_response.g.dart';

@freezed
sealed class InvoiceOverviewResponse with _$InvoiceOverviewResponse {
  const factory InvoiceOverviewResponse({
    @Default(0) int unpaidCount,
    @Default(0.0) double unpaidTotal,
    @Default(0) int partiallyPaidCount,
    @Default(0.0) double partiallyPaidTotal,
    @Default(0) int paidCount,
    @Default(0.0) double paidTotal,
  }) = _InvoiceOverviewResponse;

  factory InvoiceOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceOverviewResponseFromJson(json);
}
