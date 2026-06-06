import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_company_preferences_request.freezed.dart';
part 'upsert_company_preferences_request.g.dart';

@freezed
sealed class UpsertCompanyPreferencesRequest with _$UpsertCompanyPreferencesRequest {
  const factory UpsertCompanyPreferencesRequest({
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    @Default('en') String language,
    @Default(1) int triggerDate,
    String? triggerMessage,
  }) = _UpsertCompanyPreferencesRequest;

  factory UpsertCompanyPreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$UpsertCompanyPreferencesRequestFromJson(json);
}
