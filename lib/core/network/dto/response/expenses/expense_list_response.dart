import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense_response.dart';

part 'expense_list_response.freezed.dart';
part 'expense_list_response.g.dart';

@freezed
sealed class ExpenseListResponse with _$ExpenseListResponse {
  const factory ExpenseListResponse({
    required List<ExpenseResponse> data,
    required int totalCount,
    required int pageNumber,
    required int pageSize,
    required int totalPages,
    required bool hasPreviousPage,
    required bool hasNextPage,
    required double totalAmount,
  }) = _ExpenseListResponse;

  factory ExpenseListResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseListResponseFromJson(json);
}
