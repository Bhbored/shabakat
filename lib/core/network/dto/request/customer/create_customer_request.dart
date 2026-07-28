import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

import 'customer_pricing_override_dto.dart';

part 'create_customer_request.freezed.dart';
part 'create_customer_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class CreateCustomerRequest with _$CreateCustomerRequest {
  const factory CreateCustomerRequest({
    required String name,
    String? phone,
    String? address,
    String? building,
    String? floor,
    String? cableName,
    String? boxId,
    String? ampereScheduleId,
    String? areaId,
    required CustomerType customerType,
    required PlanType plan,
    required double planValue,
    double? initialMeterReading,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? subscriptionDate,
    CustomerRelation? customerRelation,
    CustomerPricingOverrideDto? pricingOverride,
  }) = _CreateCustomerRequest;

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerRequestFromJson(json);
}
