import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/expense/expense_service.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';

part 'single_expense_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class SingleExpenseNotifier extends _$SingleExpenseNotifier {
  ExpenseService get _expenseService => ref.read(expenseServiceProvider);

  @override
  FutureOr<Expense> build(String expenseId) async {
    final response = await _expenseService.getExpenseById(expenseId);
    return response.toEntity();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
