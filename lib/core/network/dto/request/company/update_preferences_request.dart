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
    required String language,
    required int triggerDate,
    String? triggerMessage,
  }) = _UpdatePreferencesRequest;

  factory UpdatePreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePreferencesRequestFromJson(json);
}
