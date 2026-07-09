import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/update_distribution_box_request.dart';
import 'package:shabakat/core/network/services/distribution_box/distribution_box_service.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/domain/mappers/distribution_box/distribution_box_mapper.dart';
part 'distribution_box_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DistributionBoxNotifier extends _$DistributionBoxNotifier {
  DistributionBoxService get _distributionBoxService =>
      ref.read(distributionBoxServiceProvider);
  late int _totalCount;
  @override
  FutureOr<List<DistributionBox>> build() async {
    final filter = ref.watch(distributionBoxFilterProvider);
    return _loadDistributionBoxes(filter);
  }

  Future<List<DistributionBox>> _loadDistributionBoxes(
    DistributionBoxFilterRequest filter,
  ) async {
    final response = await _distributionBoxService.getDistributionBoxes(filter);
    _totalCount = response.totalCount;
    ref.read(distributionBoxPaginationProvider.notifier).updatePagination(
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
}
