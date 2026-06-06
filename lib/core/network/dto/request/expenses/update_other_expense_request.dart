import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_other_expense_request.freezed.dart';
part 'update_other_expense_request.g.dart';

@freezed
sealed class UpdateOtherExpenseRequest with _$UpdateOtherExpenseRequest {
  const factory UpdateOtherExpenseRequest({
    double? amount,
    String? type,
    String? description,
  }) = _UpdateOtherExpenseRequest;

  factory UpdateOtherExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateOtherExpenseRequestFromJson(json);
}
