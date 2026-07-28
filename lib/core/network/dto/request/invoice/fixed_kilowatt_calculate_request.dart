import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'fixed_kilowatt_calculate_request.freezed.dart';
part 'fixed_kilowatt_calculate_request.g.dart';

@freezed
sealed class FixedKilowattCalculateRequest with _$FixedKilowattCalculateRequest {
  const factory FixedKilowattCalculateRequest({
    required CustomerType customerType,
    double? planValue,
    double? paymentAmount,
    double? kilowattAmount,
  }) = _FixedKilowattCalculateRequest;

  factory FixedKilowattCalculateRequest.fromJson(Map<String, dynamic> json) =>
      _$FixedKilowattCalculateRequestFromJson(json);
}
