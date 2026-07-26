import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'distribution_box_pagination_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class DistributionBoxPaginationNotifier
    extends _$DistributionBoxPaginationNotifier {
  @override
  DistributionBoxPagination build() => DistributionBoxPagination();

  void updatePagination(DistributionBoxPagination pagination) =>
      state = pagination;
}

class DistributionBoxPagination {
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;

  DistributionBoxPagination({
    this.totalCount = 0,
    this.pageNumber = 0,
    this.pageSize = 0,
    this.totalPages = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
  });
}
