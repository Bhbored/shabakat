import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/core/network/services/expense/expense_service.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';

import '../../repositories/repositories.dart';
part 'expense_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpenseNotifier extends _$ExpenseNotifier {
  ExpenseService get _expenseService => ref.read(expenseServiceProvider);
  ExpenseFilterRequest get _filter => ref.watch(expenseFilterProvider);
  SharedPreferencesHandler get _sharedPreferencesHandler =>
      ref.read(sharedPreferencesHandlerProvider);
  ExpenseRepo get _expenseRepo => ref.read(expenseRepoProvider);
  @override
  FutureOr<List<Expense>> build() async => await _loadExpenses();

  Future<List<Expense>> _loadExpenses() async {
    final isOfflineMode = await _sharedPreferencesHandler.isOfflineMode();
    final pagination = ref.read(expensePaginationProvider.notifier);

    if (isOfflineMode) {
      final expenses = await _expenseRepo.getAllExpenses(
        _filter.dateFrom,
        _filter.dateTo,
        _filter.expenseType,
        pageNumber: _filter.pageNumber,
        pageSize: _filter.pageSize,
      );

      final totalCount = await _expenseRepo.getTotalExpensesCount();
      final totalPages = totalCount == 0
          ? 0
          : (totalCount / _filter.pageSize).ceil();
      pagination.updatePagination(
        ExpensePagination(
          totalCount: totalCount,
          pageNumber: _filter.pageNumber,
          pageSize: _filter.pageSize,
          totalPages: totalPages,
          hasPreviousPage: _filter.pageNumber > 1,
          hasNextPage: _filter.pageNumber < totalPages,
        ),
      );
      return expenses;
    } else {
      final expenses = await _expenseService.getExpenses(_filter);
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
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }

  Future<void> createExpense(CreateExpenseRequest request) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _expenseService.createExpense(request);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> updateExpense(
    UpdateExpenseRequest request,
    String expenseId,
  ) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _expenseService.updateExpense(expenseId, request);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _expenseService.deleteExpense(expenseId);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }
}
