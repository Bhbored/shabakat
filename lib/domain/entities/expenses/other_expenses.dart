import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_expenses.freezed.dart';
part 'other_expenses.g.dart';

@freezed
sealed class OtherExpenses with _$OtherExpenses {
  const factory OtherExpenses({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String companyId,
    required String expenseId,
    required double amount,
    required String type,
    String? description,
  }) = _OtherExpenses;

  factory OtherExpenses.fromJson(Map<String, dynamic> json) =>
      _$OtherExpensesFromJson(json);
}
