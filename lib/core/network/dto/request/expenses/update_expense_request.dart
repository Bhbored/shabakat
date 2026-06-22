import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_expense_request.freezed.dart';
part 'update_expense_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class UpdateExpenseRequest with _$UpdateExpenseRequest {
  const factory UpdateExpenseRequest({
    String? expenseType,
    double? amount,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? expenseDate,
    String? label,
    String? notes,
  }) = _UpdateExpenseRequest;

  factory UpdateExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpenseRequestFromJson(json);
}
