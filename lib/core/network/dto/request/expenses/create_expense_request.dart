import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_expense_request.freezed.dart';
part 'create_expense_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class CreateExpenseRequest with _$CreateExpenseRequest {
  const factory CreateExpenseRequest({
    required double fuelExpense,
    required double maintenanceExpenses,
    required double employeesExpenses,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? expenseDate,
    String? notes,
  }) = _CreateExpenseRequest;

  factory CreateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateExpenseRequestFromJson(json);
}
