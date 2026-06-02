import 'package:freezed_annotation/freezed_annotation.dart';

import 'customer_pricing_override_dto.dart';

part 'customer_update_request.freezed.dart';
part 'customer_update_request.g.dart';

@freezed
sealed class CustomerUpdateRequest with _$CustomerUpdateRequest {
  const factory CustomerUpdateRequest({
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
  }) = _CustomerUpdateRequest;

  factory CustomerUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerUpdateRequestFromJson(json);
}
