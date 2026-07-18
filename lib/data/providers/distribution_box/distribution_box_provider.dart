import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/update_distribution_box_request.dart';
import 'package:shabakat/core/network/services/distribution_box/distribution_box_service.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/data/providers/offline/offline_mode_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/domain/mappers/distribution_box/distribution_box_mapper.dart';

import '../../repositories/repositories.dart';
part 'distribution_box_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DistributionBoxNotifier extends _$DistributionBoxNotifier {
  DistributionBoxService get _distributionBoxService =>
      ref.read(distributionBoxServiceProvider);
  DistributionBoxRepo get _distributionBoxRepo =>
      ref.read(distributionBoxRepoProvider);
  late int _totalCount;
  @override
  FutureOr<List<DistributionBox>> build() async {
    final filter = ref.watch(distributionBoxFilterProvider);
    final isOfflineMode = await ref.watch(offlineModeProvider.future);
    return _loadDistributionBoxes(filter, isOfflineMode);
  }

  Future<List<DistributionBox>> _loadDistributionBoxes(
    DistributionBoxFilterRequest filter,
    bool isOfflineMode,
  ) async {
    if (isOfflineMode) {
      final distributionBoxes = await _distributionBoxRepo
          .getAllDistributionBoxes(
            filter.areaId,
            filter.name,
            pageNumber: filter.pageNumber,
            pageSize: filter.pageSize,
          );

      _totalCount = await _distributionBoxRepo.getTotalDistributionBoxesCount(
        areaId: filter.areaId,
        name: filter.name,
      );
      final totalPages = _totalCount == 0
          ? 0
          : (_totalCount / filter.pageSize).ceil();
      ref
          .read(distributionBoxPaginationProvider.notifier)
          .updatePagination(
            DistributionBoxPagination(
              totalCount: _totalCount,
              pageNumber: filter.pageNumber,
              pageSize: filter.pageSize,
              totalPages: totalPages,
              hasPreviousPage: filter.pageNumber > 1,
              hasNextPage: filter.pageNumber < totalPages,
            ),
          );
      return distributionBoxes;
    } else {
      final response = await _distributionBoxService.getDistributionBoxes(
        filter,
      );
      _totalCount = response.totalCount;
      ref
          .read(distributionBoxPaginationProvider.notifier)
          .updatePagination(
            DistributionBoxPagination(
              totalCount: response.totalCount,
              pageNumber: response.pageNumber,
              pageSize: response.pageSize,
              totalPages: response.totalPages,
              hasPreviousPage: response.hasPreviousPage,
              hasNextPage: response.hasNextPage,
            ),
          );
      return response.data.map((x) => x.toEntity()).toList();
    }
  }

  int getTotalCount() {
    return _totalCount;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }

  Future<void> createDistributionBox(
    CreateDistributionBoxRequest request,
  ) async {
    await _distributionBoxService.createDistributionBox(request);
    await refresh();
  }

  Future<void> updateDistributionBox(
    UpdateDistributionBoxRequest request,
    String boxId,
  ) async {
    await _distributionBoxService.updateDistributionBox(boxId, request);
    await refresh();
  }

  Future<void> deleteDistributionBox(String boxId) async {
    await _distributionBoxService.deleteDistributionBox(boxId);
    await refresh();
  }
}
