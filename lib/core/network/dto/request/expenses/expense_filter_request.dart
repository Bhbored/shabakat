import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_filter_request.freezed.dart';
part 'expense_filter_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class ExpenseFilterRequest with _$ExpenseFilterRequest {
  const factory ExpenseFilterRequest({
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? dateFrom,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? dateTo,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
  }) = _ExpenseFilterRequest;

  factory ExpenseFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFilterRequestFromJson(json);
}
