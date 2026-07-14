import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';
import 'package:shabakat/core/network/dto/request/area/update_area_request.dart';
import 'package:shabakat/core/network/services/area/area_service.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/domain/mappers/area/area_mapper.dart';

import '../../repositories/repositories.dart';
part 'area_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AreaNotifier extends _$AreaNotifier {
  AreaService get _areaService => ref.read(areaServiceProvider);
  SharedPreferencesHandler get _sharedPreferencesHandler =>
      ref.read(sharedPreferencesHandlerProvider);
  AreaRepo get _areaRepo => ref.read(areaRepoProvider);

  @override
  FutureOr<List<Area>> build() async => await _loadAreas();

  Future<List<Area>> _loadAreas() async {
    final isOfflineMode = await _sharedPreferencesHandler.isOfflineMode();
    if (isOfflineMode) {
      return await _areaRepo.getAllAreas();
    } else {
      final areas = await _areaService.getAreas();
      return areas.map((x) => x.toEntity()).toList();
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }

  Future<void> createArea(CreateAreaRequest request) async {
    await _areaService.createArea(request);
    await refresh();
  }

  Future<void> updateArea(UpdateAreaRequest request, String areaId) async {
    await _areaService.updateArea(areaId, request);
    await refresh();
  }

  Future<void> deleteArea(String areaId) async {
    await _areaService.deleteArea(areaId);
    await refresh();
  }
}
