import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_preferences_response.freezed.dart';
part 'get_preferences_response.g.dart';

@freezed
sealed class GetPreferencesResponse with _$GetPreferencesResponse {
  const factory GetPreferencesResponse({
    @Default(0) double pricePerKilowat,
    @Default(0) double pricePerAmp,
    @Default(0) double fixedCharge,
    @Default(11) double tva,
    @Default(0) double residentialPricePerAmp,
    @Default(0) double residentialPricePerKilowat,
    @Default(0) double residentialFixedCharge,
    @Default(11) double residentialTVA,
    @Default(0) double commercialPricePerAmp,
    @Default(0) double commercialPricePerKilowat,
    @Default(0) double commercialFixedCharge,
    @Default(11) double commercialTVA,
    @Default(0) double industrialPricePerAmp,
    @Default(0) double industrialPricePerKilowat,
    @Default(0) double industrialFixedCharge,
    @Default(11) double industrialTVA,
    @Default('en') String language,
    @Default(1) int triggerDate,
    String? triggerMessage,
  }) = _GetPreferencesResponse;

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPreferencesResponseFromJson(json);
}
