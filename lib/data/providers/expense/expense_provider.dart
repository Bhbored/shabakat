import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_other_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/core/network/services/expense/expense_service.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';
part 'expense_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class ExpenseNotifier extends _$ExpenseNotifier {
  ExpenseService get _expenseService => ref.read(expenseServiceProvider);

  @override
  FutureOr<List<Expenses>> build() async => await _loadExpenses();

  Future<List<Expenses>> _loadExpenses() async {
    final expenses = await _expenseService.getExpenses(
      ExpenseFilterRequest(),
    );
    return expenses.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _loadExpenses());
  }

  Future<void> createExpense(CreateExpenseRequest request) async {
    await _expenseService.createExpense(request);
    await refresh();
  }

  Future<void> updateExpense(
    UpdateExpenseRequest request,
    String expenseId,
  ) async {
    await _expenseService.updateExpense(expenseId, request);
    await refresh();
  }

  Future<void> deleteExpense(String expenseId) async {
    await _expenseService.deleteExpense(expenseId);
    await refresh();
  }

  Future<void> addOtherExpense(
    String expenseId,
    CreateOtherExpenseRequest request,
  ) async {
    await _expenseService.addOtherExpense(expenseId, request);
    await refresh();
  }

  Future<void> deleteOtherExpense(String otherExpenseId) async {
    await _expenseService.deleteOtherExpense(otherExpenseId);
    await refresh();
  }
}
