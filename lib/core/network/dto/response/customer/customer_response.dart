import 'package:freezed_annotation/freezed_annotation.dart';

import '../../request/customer/customer_pricing_override_dto.dart';

part 'customer_response.freezed.dart';
part 'customer_response.g.dart';

String _dateOnlyToJson(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

DateTime _dateOnlyFromJson(String date) => DateTime.parse(date);

@freezed
sealed class CustomerResponse with _$CustomerResponse {
  const factory CustomerResponse({
    required String id,
    required String name,
    String? phone,
    String? address,
    String? building,
    String? floor,
    String? cableName,
    String? boxId,
    String? boxName,
    String? ampereScheduleId,
    String? ampereScheduleName,
    required String customerType,
    required String plan,
    required double planValue,
    double? initialMeterReading,
    String? areaName,
    required String customerStatus,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    required DateTime subscriptionDate,
    required DateTime createdAt,
    String? customerRelation,
    required bool hasPricingOverride,
    CustomerPricingOverrideDto? pricingOverride,
    @Default(0.0) double totalBilled,
    @Default(0.0) double totalPaid,
    @Default(0.0) double totalOutstanding,
  }) = _CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
}
