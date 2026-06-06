import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_summary_response.freezed.dart';
part 'expense_summary_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class ExpenseSummaryResponse with _$ExpenseSummaryResponse {
  const factory ExpenseSummaryResponse({
    required String id,
    required double fuelExpense,
    required double maintenanceExpenses,
    required double employeesExpenses,
    required double otherExpensesTotal,
    required double totalExpense,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime expenseDate,
    String? notes,
    required DateTime createdAt,
  }) = _ExpenseSummaryResponse;

  factory ExpenseSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpenseSummaryResponseFromJson(json);
}
