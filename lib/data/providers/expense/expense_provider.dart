import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/core/network/services/expense/expense_service.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';
import 'package:shabakat/data/providers/offline/offline_mode_provider.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';

import '../../repositories/repositories.dart';
part 'expense_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpenseNotifier extends _$ExpenseNotifier {
  ExpenseService get _expenseService => ref.read(expenseServiceProvider);
  ExpenseRepo get _expenseRepo => ref.read(expenseRepoProvider);
  @override
  FutureOr<List<Expense>> build() async {
    final filter = ref.watch(expenseFilterProvider);
    final isOfflineMode = await ref.watch(offlineModeProvider.future);
    return _loadExpenses(filter, isOfflineMode);
  }

  Future<List<Expense>> _loadExpenses(
    ExpenseFilterRequest filter,
    bool isOfflineMode,
  ) async {
    final pagination = ref.read(expensePaginationProvider.notifier);

    if (isOfflineMode) {
      final expenses = await _expenseRepo.getAllExpenses(
        filter.dateFrom,
        filter.dateTo,
        filter.expenseType,
        pageNumber: filter.pageNumber,
        pageSize: filter.pageSize,
      );

      final totalCount = await _expenseRepo.getTotalExpensesCount();
      final totalPages = totalCount == 0
          ? 0
          : (totalCount / filter.pageSize).ceil();
      pagination.updatePagination(
        ExpensePagination(
          totalCount: totalCount,
          pageNumber: filter.pageNumber,
          pageSize: filter.pageSize,
          totalPages: totalPages,
          hasPreviousPage: filter.pageNumber > 1,
          hasNextPage: filter.pageNumber < totalPages,
        ),
      );
      return expenses;
    } else {
      final expenses = await _expenseService.getExpenses(filter);
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
