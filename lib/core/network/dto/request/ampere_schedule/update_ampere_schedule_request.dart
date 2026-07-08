import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_ampere_schedule_request.freezed.dart';
part 'update_ampere_schedule_request.g.dart';

@freezed
sealed class UpdateAmpereScheduleRequest with _$UpdateAmpereScheduleRequest {
  const factory UpdateAmpereScheduleRequest({
    required String name,
    required int hoursPerDay,
    required double pricePerAmp,
  }) = _UpdateAmpereScheduleRequest;

  factory UpdateAmpereScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAmpereScheduleRequestFromJson(json);
}
