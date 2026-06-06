import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_preferences_response.freezed.dart';
part 'get_preferences_response.g.dart';

@freezed
sealed class GetPreferencesResponse with _$GetPreferencesResponse {
  const factory GetPreferencesResponse({
    required double pricePerKilowat,
    required double pricePerAmp,
    required double fixedCharge,
    required double tva,
    required String language,
    required int triggerDate,
    String? triggerMessage,
  }) = _GetPreferencesResponse;

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPreferencesResponseFromJson(json);
}
