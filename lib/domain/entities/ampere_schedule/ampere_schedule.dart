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
    @Default(0) double residentialPricePerAmp,
    @Default(0) double commercialPricePerAmp,
    @Default(0) double industrialPricePerAmp,
    @Default(0) int customerCount,
    @Default(true) bool canBeDeleted,
    required DateTime createdAt,
  }) = _AmpereSchedule;

  factory AmpereSchedule.fromJson(Map<String, dynamic> json) =>
      _$AmpereScheduleFromJson(json);
}
