import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_pagination_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class CustomerPaginationNotifier extends _$CustomerPaginationNotifier {
  @override
  CustomerPagination build() => CustomerPagination();
  void updatePagination(CustomerPagination pagination) => state = pagination;
}

class CustomerPagination {
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;
  CustomerPagination({
    this.totalCount = 0,
    this.pageNumber = 0,
    this.pageSize = 0,
    this.totalPages = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
  });
}
