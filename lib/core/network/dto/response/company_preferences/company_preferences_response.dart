import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_preferences_response.freezed.dart';
part 'company_preferences_response.g.dart';

@freezed
sealed class CompanyPreferencesResponse with _$CompanyPreferencesResponse {
  const factory CompanyPreferencesResponse({
    required String id,
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    required String language,
    required int triggerDate,
    String? triggerMessage,
    required DateTime updatedAt,
  }) = _CompanyPreferencesResponse;

  factory CompanyPreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyPreferencesResponseFromJson(json);
}
