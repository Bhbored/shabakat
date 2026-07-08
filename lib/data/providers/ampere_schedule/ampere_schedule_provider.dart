import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/create_ampere_schedule_request.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/update_ampere_schedule_request.dart';
import 'package:shabakat/core/network/services/ampere_schedule/ampere_schedule_service.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/domain/mappers/ampere_schedule/ampere_schedule_mapper.dart';
part 'ampere_schedule_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AmpereScheduleNotifier extends _$AmpereScheduleNotifier {
  AmpereScheduleService get _ampereScheduleService =>
      ref.read(ampereScheduleServiceProvider);

  @override
  FutureOr<List<AmpereSchedule>> build() async => await _loadAmpereSchedules();

  Future<List<AmpereSchedule>> _loadAmpereSchedules() async {
    final schedules = await _ampereScheduleService.getAmpereSchedules();
    return schedules.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }

  Future<void> createAmpereSchedule(CreateAmpereScheduleRequest request) async {
    await _ampereScheduleService.createAmpereSchedule(request);
    await refresh();
  }

  Future<void> updateAmpereSchedule(
    UpdateAmpereScheduleRequest request,
    String scheduleId,
  ) async {
    await _ampereScheduleService.updateAmpereSchedule(scheduleId, request);
    await refresh();
  }
}
