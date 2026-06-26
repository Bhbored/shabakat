import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_reading.freezed.dart';
part 'meter_reading.g.dart';

@freezed
sealed class MeterReading with _$MeterReading {
  const factory MeterReading({
    required String id,
    required double readingValue,
    double? consumption,
    required DateTime createdAt,
  }) = _MeterReading;

  factory MeterReading.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingFromJson(json);
}
