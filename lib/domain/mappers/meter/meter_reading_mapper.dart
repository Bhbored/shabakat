import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/network/dto/response/meter/meter_reading_response.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension MeterReadingResponseMapper on MeterReadingResponse {
  MeterReading toEntity() => MeterReading(
    id: id,
    readingValue: readingValue,
    consumption: consumption,
    createdAt: createdAt,
  );
}

extension MeterReadingEntityMapper on MeterReading {
  drift.MeterReadingsCompanion toCompanion({required String customerId}) =>
      drift.MeterReadingsCompanion(
        id: Value(id),
        customerId: Value(customerId),
        readingValue: Value(readingValue),
        consumption: Value(consumption),
        createdAt: Value(createdAt),
      );
}

extension MeterReadingDriftMapper on drift.MeterReading {
  MeterReading toEntity() => MeterReading(
    id: id,
    readingValue: readingValue,
    consumption: consumption,
    createdAt: createdAt,
  );
}
