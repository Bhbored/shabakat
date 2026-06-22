import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/core/network/services/expense/expense_service.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';
part 'expense_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpenseNotifier extends _$ExpenseNotifier {
  ExpenseService get _expenseService => ref.read(expenseServiceProvider);
  ExpenseFilterRequest get _filter => ref.watch(expenseFilterProvider);

  @override
  FutureOr<List<Expense>> build() async => await _loadExpenses();

  Future<List<Expense>> _loadExpenses() async {
    final expenses = await _expenseService.getExpenses(_filter);
    final pagination = ref.read(expensePaginationProvider.notifier);
    pagination.updatePagination(
      ExpensePagination(
        totalCount: expenses.totalCount,
        pageNumber: expenses.pageNumber,
        pageSize: expenses.pageSize,
        totalPages: expenses.totalPages,
        hasPreviousPage: expenses.hasPreviousPage,
        hasNextPage: expenses.hasNextPage,
        totalAmount: expenses.totalAmount,
      ),
    );
    return expenses.data.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> createExpense(CreateExpenseRequest request) async {
    await _expenseService.createExpense(request);
    await refresh();
  }

  Future<void> updateExpense(
    UpdateExpenseRequest request,
    String expenseId,
  ) async {
    state = AsyncValue.loading();
    await _expenseService.updateExpense(expenseId, request);
    await refresh();
  }

  Future<void> deleteExpense(String expenseId) async {
    state = AsyncValue.loading();
    await _expenseService.deleteExpense(expenseId);
    await refresh();
  }
}
