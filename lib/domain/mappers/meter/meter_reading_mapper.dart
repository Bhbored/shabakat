import 'package:shabakat/core/network/dto/response/meter/meter_reading_response.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';

extension MeterReadingResponseMapper on MeterReadingResponse {
  MeterReading toEntity() => MeterReading(
    id: id,
    readingValue: readingValue,
    consumption: consumption,
    createdAt: createdAt,
  );
}
