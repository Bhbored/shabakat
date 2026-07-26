import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';

part 'distribution_box_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DistributionBoxFilterNotifier extends _$DistributionBoxFilterNotifier {
  @override
  DistributionBoxFilterRequest build() => const DistributionBoxFilterRequest();

  void update(DistributionBoxFilterRequest next) {
    state = state.copyWith(
      areaId: next.areaId,
      name: next.name,
      pageNumber: next.pageNumber,
      pageSize: next.pageSize,
    );
  }

  void nextPage() {
    state = state.copyWith(pageNumber: state.pageNumber + 1);
  }

  void previousPage() {
    state = state.copyWith(pageNumber: state.pageNumber - 1);
  }

  void firstPage() {
    state = state.copyWith(pageNumber: 1);
  }

  void lastPage() {
    state = state.copyWith(
      pageNumber: ref.read(distributionBoxPaginationProvider).totalPages,
    );
  }

  void clear() => state = const DistributionBoxFilterRequest();
}
