import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';

part 'expense_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpenseFilterNotifier extends _$ExpenseFilterNotifier {
  @override
  ExpenseFilterRequest build() => const ExpenseFilterRequest();

  void updateFilter(ExpenseFilterRequest filter) => state = filter;

  void clearFilter() {
    state = const ExpenseFilterRequest();
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
      pageNumber: ref.read(expensePaginationProvider).totalPages,
    );
  }
}
