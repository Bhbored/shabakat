import 'package:freezed_annotation/freezed_annotation.dart';

part 'ampere_schedule.freezed.dart';
part 'ampere_schedule.g.dart';

@freezed
sealed class AmpereSchedule with _$AmpereSchedule {
  const factory AmpereSchedule({
    required String id,
    required String name,
    required int hoursPerDay,
    required double pricePerAmp,
    @Default(0) int customerCount,
    required DateTime createdAt,
  }) = _AmpereSchedule;

  factory AmpereSchedule.fromJson(Map<String, dynamic> json) =>
      _$AmpereScheduleFromJson(json);
}
