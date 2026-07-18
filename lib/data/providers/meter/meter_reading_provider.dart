import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/meter/create_meter_reading_request.dart';
import 'package:shabakat/core/network/services/meter/meter_reading_service.dart';
import 'package:shabakat/data/providers/offline/offline_mode_provider.dart';
import 'package:shabakat/domain/entities/meter/meter_reading.dart';
import 'package:shabakat/domain/mappers/meter/meter_reading_mapper.dart';

import '../../repositories/repositories.dart';

part 'meter_reading_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class MeterReadingNotifier extends _$MeterReadingNotifier {
  MeterReadingService get _meterReadingService =>
      ref.read(meterReadingServiceProvider);
  MeterReadingRepo get _meterReadingRepo => ref.read(meterReadingRepoProvider);
  @override
  FutureOr<List<MeterReading>> build(String customerId) async {
    final isOfflineMode = await ref.watch(offlineModeProvider.future);
    return _loadMeterReadings(isOfflineMode);
  }

  Future<List<MeterReading>> _loadMeterReadings(bool isOfflineMode) async {
    if (isOfflineMode) {
      final readings = await _meterReadingRepo.getMeterReadingsByCustomerId(
        customerId,
      );
      return readings;
    } else {
      final readings = await _meterReadingService.getMeterReadings(customerId);
      return readings.map((x) => x.toEntity()).toList();
    }
  }

  Future<MeterReading> getLatestMeterReading() async {
    final response = await _meterReadingService.getLatestMeterReading(
      customerId,
    );
    return response.toEntity();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<MeterReading> createMeterReading(
    CreateMeterReadingRequest request,
  ) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      final response = await _meterReadingService.createMeterReading(
        customerId,
        request,
      );
      await refresh();
      return response.toEntity();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> deleteMeterReading(String readingId) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _meterReadingService.deleteMeterReading(customerId, readingId);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }
}
