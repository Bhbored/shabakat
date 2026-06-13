import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';
import 'package:shabakat/core/network/dto/request/area/update_area_request.dart';
import 'package:shabakat/core/network/services/area/area_service.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/domain/mappers/area/area_mapper.dart';
part 'area_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AreaNotifier extends _$AreaNotifier {
  AreaService get _areaService => ref.read(areaServiceProvider);

  @override
  FutureOr<List<Area>> build() async => await _loadAreas();

  Future<List<Area>> _loadAreas() async {
    final areas = await _areaService.getAreas();
    return areas.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> createArea(CreateAreaRequest request) async {
    await _areaService.createArea(request);
    await refresh();
  }

  Future<void> updateArea(
    UpdateAreaRequest request,
    String areaId,
  ) async {
    await _areaService.updateArea(areaId, request);
    await refresh();
  }

  Future<void> deleteArea(String areaId) async {
    await _areaService.deleteArea(areaId);
    await refresh();
  }
}
