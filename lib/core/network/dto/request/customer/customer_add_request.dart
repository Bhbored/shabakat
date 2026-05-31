import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';

import 'customer_pricing_override_dto.dart';

part 'customer_add_request.freezed.dart';
part 'customer_add_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class CustomerAddRequest with _$CustomerAddRequest {
  const factory CustomerAddRequest({
    required String name,
    String? phone,
    String? address,
    required CustomerType customerType,
    required PlanType plan,
    required double planValue,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? subscriptionDate,
    CustomerRelation? customerRelation,
    CustomerPricingOverrideDto? pricingOverride,
  }) = _CustomerAddRequest;

  factory CustomerAddRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddRequestFromJson(json);
}
