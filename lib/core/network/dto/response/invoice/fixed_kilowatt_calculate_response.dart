import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixed_kilowatt_calculate_response.freezed.dart';
part 'fixed_kilowatt_calculate_response.g.dart';

@freezed
sealed class FixedKilowattCalculateResponse
    with _$FixedKilowattCalculateResponse {
  const factory FixedKilowattCalculateResponse({
    required double paymentAmount,
    required double kilowattAmount,
    required double unitPrice,
    required double fixedCharge,
    required double tva,
    required double planValue,
    required String customerType,
  }) = _FixedKilowattCalculateResponse;

  factory FixedKilowattCalculateResponse.fromJson(Map<String, dynamic> json) =>
      _$FixedKilowattCalculateResponseFromJson(json);
}
