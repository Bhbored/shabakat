import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_ampere_schedule_request.freezed.dart';
part 'create_ampere_schedule_request.g.dart';

@freezed
sealed class CreateAmpereScheduleRequest with _$CreateAmpereScheduleRequest {
  const factory CreateAmpereScheduleRequest({
    required String name,
    required int hoursPerDay,
    double? pricePerAmp,
    double? residentialPricePerAmp,
    double? commercialPricePerAmp,
    double? industrialPricePerAmp,
  }) = _CreateAmpereScheduleRequest;

  factory CreateAmpereScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAmpereScheduleRequestFromJson(json);
}
