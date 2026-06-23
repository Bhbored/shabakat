import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invoice_pagination_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class InvoicePaginationNotifier extends _$InvoicePaginationNotifier {
  @override
  InvoicePagination build() => InvoicePagination();
  void updatePagination(InvoicePagination pagination) => state = pagination;
}

class InvoicePagination {
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;
  InvoicePagination({
    this.totalCount = 0,
    this.pageNumber = 0,
    this.pageSize = 0,
    this.totalPages = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
  });
}
