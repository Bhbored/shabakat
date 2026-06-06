import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer_pricing_override_dto.dart';

part 'update_customer_request.freezed.dart';
part 'update_customer_request.g.dart';

@freezed
sealed class UpdateCustomerRequest with _$UpdateCustomerRequest {
  const factory UpdateCustomerRequest({
    String? name,
    String? phone,
    String? address,
    String? areaId,
    String? customerType,
    String? plan,
    double? planValue,
    String? customerStatus,
    String? customerRelation,
    CustomerPricingOverrideDto? pricingOverride,
    @Default(false) bool clearPricingOverride,
  }) = _UpdateCustomerRequest;

  factory UpdateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerRequestFromJson(json);
}
