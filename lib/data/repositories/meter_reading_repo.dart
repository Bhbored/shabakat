import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';
import 'package:shabakat/domain/mappers/meter/meter_reading_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class MeterReadingRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  MeterReadingRepo(this._db);

  Future<List<MeterReading>> getMeterReadingsByCustomerId(
    String customerId, {
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final rows =
          await (_db.select(_db.meterReadings)
                ..where((r) => r.customerId.equals(customerId))
                ..orderBy([(r) => OrderingTerm.desc(r.createdAt)])
                ..limit(pageSize, offset: (pageNumber - 1) * pageSize))
              .get();
      final readings = rows.map((e) => e.toEntity()).toList();
      _logger.i(
        'Meter readings retrieved from local DB for customer $customerId: ${readings.length}',
      );
      return readings;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve meter readings from local DB for customer $customerId: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addMeterReading(
    MeterReading reading, {
    required String customerId,
  }) async {
    try {
      await _db
          .into(_db.meterReadings)
          .insert(
            reading.toCompanion(customerId: customerId),
            mode: InsertMode.insertOrReplace,
          );
      _logger.i('Meter reading added to local DB: ${reading.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add meter reading to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddMeterReadings(
    String customerId,
    List<MeterReading> readings,
  ) async {
    try {
      await _db.batch((b) {
        for (final reading in readings) {
          b.insert(
            _db.meterReadings,
            reading.toCompanion(customerId: customerId),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i(
        'Bulk added meter readings to local DB for customer $customerId: ${readings.length}',
      );
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add meter readings to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteMeterReadingById(String id) async {
    try {
      final deleted = await (_db.delete(
        _db.meterReadings,
      )..where((r) => r.id.equals(id))).go();
      _logger.i(
        'Deleted meter reading from local DB by id: $id ($deleted rows)',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete meter reading from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteMeterReadings() async {
    try {
      final deleted = await (_db.delete(_db.meterReadings)).go();
      _logger.i('Bulk deleted all meter readings from local DB: $deleted rows');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete meter readings from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
