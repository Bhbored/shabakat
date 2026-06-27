import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_by_type_response.freezed.dart';
part 'expenses_by_type_response.g.dart';

@freezed
sealed class ExpensesByTypeResponse with _$ExpensesByTypeResponse {
  const factory ExpensesByTypeResponse({
    @Default(0.0) double fuel,
    @Default(0.0) double maintenance,
    @Default(0.0) double employees,
    @Default(0.0) double other,
  }) = _ExpensesByTypeResponse;

  factory ExpensesByTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpensesByTypeResponseFromJson(json);
}
