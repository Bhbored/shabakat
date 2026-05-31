import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_pricing_override_dto.freezed.dart';
part 'customer_pricing_override_dto.g.dart';

@freezed
sealed class CustomerPricingOverrideDto with _$CustomerPricingOverrideDto {
  const factory CustomerPricingOverrideDto({
    required double price,
    required double fixedCharge,
    required double tva,
  }) = _CustomerPricingOverrideDto;

  factory CustomerPricingOverrideDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerPricingOverrideDtoFromJson(json);
}
