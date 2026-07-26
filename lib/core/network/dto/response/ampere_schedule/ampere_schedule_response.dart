import 'package:freezed_annotation/freezed_annotation.dart';

part 'ampere_schedule_response.freezed.dart';
part 'ampere_schedule_response.g.dart';

@freezed
sealed class AmpereScheduleResponse with _$AmpereScheduleResponse {
  const factory AmpereScheduleResponse({
    required String id,
    required String name,
    required int hoursPerDay,
    required double pricePerAmp,
    required double residentialPricePerAmp,
    required double commercialPricePerAmp,
    required double industrialPricePerAmp,
    required int customerCount,
    required bool canBeDeleted,
    required DateTime createdAt,
  }) = _AmpereScheduleResponse;

  factory AmpereScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$AmpereScheduleResponseFromJson(json);
}
