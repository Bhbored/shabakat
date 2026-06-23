import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_summary_response.dart';

part 'customer_list_summery_response.freezed.dart';

part 'customer_list_summery_response.g.dart';

@freezed
sealed class CustomerListSummeryResponse with _$CustomerListSummeryResponse {
  const factory CustomerListSummeryResponse({
    @Default([]) List<CustomerSummaryResponse> data,
    @Default(0) int totalCount,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
    @Default(0) int totalPages,
    @Default(false) bool hasPreviousPage,
    @Default(false) bool hasNextPage,
  }) = _CustomerListSummeryResponse;

  factory CustomerListSummeryResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerListSummeryResponseFromJson(json);
}
