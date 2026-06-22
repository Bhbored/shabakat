import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_pagination_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpensePaginationNotifier extends _$ExpensePaginationNotifier {
  @override
  ExpensePagination build() => ExpensePagination();

  void updatePagination(ExpensePagination pagination) => state = pagination;
}

class ExpensePagination {
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final double totalAmount;

  ExpensePagination({
    this.totalCount = 0,
    this.pageNumber = 0,
    this.pageSize = 0,
    this.totalPages = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
    this.totalAmount = 0,
  });
}
