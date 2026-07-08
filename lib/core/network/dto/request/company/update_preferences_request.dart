import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_preferences_request.freezed.dart';
part 'update_preferences_request.g.dart';

@freezed
sealed class UpdatePreferencesRequest with _$UpdatePreferencesRequest {
  const factory UpdatePreferencesRequest({
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    required double residentialPricePerAmp,
    required double residentialPricePerKilowat,
    required double residentialFixedCharge,
    required double residentialTVA,
    required double commercialPricePerAmp,
    required double commercialPricePerKilowat,
    required double commercialFixedCharge,
    required double commercialTVA,
    required double industrialPricePerAmp,
    required double industrialPricePerKilowat,
    required double industrialFixedCharge,
    required double industrialTVA,
    required String language,
    required int dueDate,
    required int triggerDate,
    String? triggerMessage,
    required bool ampereSchedulePricingEnabled,
  }) = _UpdatePreferencesRequest;

  factory UpdatePreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePreferencesRequestFromJson(json);
}
