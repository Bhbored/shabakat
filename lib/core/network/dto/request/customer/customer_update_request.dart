import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/core/enums/plan_type.dart';

import 'customer_pricing_override_dto.dart';

part 'customer_update_request.freezed.dart';
part 'customer_update_request.g.dart';

@freezed
sealed class CustomerUpdateRequest with _$CustomerUpdateRequest {
  const factory CustomerUpdateRequest({
    String? name,
    String? phone,
    String? address,
    CustomerType? customerType,
    PlanType? plan,
    double? planValue,
    CustomerStatus? customerStatus,
    CustomerRelation? customerRelation,
    CustomerPricingOverrideDto? pricingOverride,
    @Default(false) bool clearPricingOverride,
  }) = _CustomerUpdateRequest;

  factory CustomerUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerUpdateRequestFromJson(json);
}
