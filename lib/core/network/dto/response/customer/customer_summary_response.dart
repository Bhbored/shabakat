import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_summary_response.freezed.dart';
part 'customer_summary_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class CustomerSummaryResponse with _$CustomerSummaryResponse {
  const factory CustomerSummaryResponse({
    required String id,
    required String name,
    String? phone,
    String? address,
    required String customerType,
    required String plan,
    String? areaName,
    required double planValue,
    required String customerStatus,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime subscriptionDate,
    required DateTime createdAt,
    required bool hasPricingOverride,
    String? customerRelation,
    required double amountDue,
  }) = _CustomerSummaryResponse;

  factory CustomerSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerSummaryResponseFromJson(json);
}
