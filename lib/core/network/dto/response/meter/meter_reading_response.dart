import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_reading_response.freezed.dart';
part 'meter_reading_response.g.dart';

@freezed
sealed class MeterReadingResponse with _$MeterReadingResponse {
  const factory MeterReadingResponse({
    required String id,
    required double readingValue,
    double? consumption,
    required DateTime createdAt,
  }) = _MeterReadingResponse;

  factory MeterReadingResponse.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingResponseFromJson(json);
}
