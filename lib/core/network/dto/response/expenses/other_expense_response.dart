import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_expense_response.freezed.dart';
part 'other_expense_response.g.dart';

@freezed
sealed class OtherExpenseResponse with _$OtherExpenseResponse {
  const factory OtherExpenseResponse({
    required String id,
    required String expenseId,
    required double amount,
    required String type,
    String? description,
    required DateTime createdAt,
  }) = _OtherExpenseResponse;

  factory OtherExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$OtherExpenseResponseFromJson(json);
}
