import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_response.freezed.dart';
part 'expense_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class ExpenseResponse with _$ExpenseResponse {
  const factory ExpenseResponse({
    required String id,
    required String expenseType,
    required double amount,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime expenseDate,
    String? label,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseResponse;

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponseFromJson(json);
}
