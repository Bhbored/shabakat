import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_meter_reading_request.freezed.dart';
part 'create_meter_reading_request.g.dart';

String? _dateOnlyToJson(DateTime? date) =>
    date != null
        ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class CreateMeterReadingRequest with _$CreateMeterReadingRequest {
  const factory CreateMeterReadingRequest({
    required double readingValue,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? readingDate,
  }) = _CreateMeterReadingRequest;

  factory CreateMeterReadingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMeterReadingRequestFromJson(json);
}
