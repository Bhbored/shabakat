import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_other_expense_request.freezed.dart';
part 'create_other_expense_request.g.dart';

@freezed
sealed class CreateOtherExpenseRequest with _$CreateOtherExpenseRequest {
  const factory CreateOtherExpenseRequest({
    required double amount,
    required String type,
    String? description,
  }) = _CreateOtherExpenseRequest;

  factory CreateOtherExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOtherExpenseRequestFromJson(json);
}
