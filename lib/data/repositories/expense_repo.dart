import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/core/enums/expense_type.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class ExpenseRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  ExpenseRepo(this._db);

  Future<List<Expense>> getAllExpenses(
    DateTime? dateFrom,
    DateTime? dateTo,
    ExpenseType? expenseType, {
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final select = _db.select(_db.expensesTable);

      final expressions = <Expression<bool>>[];
      if (dateFrom != null) {
        expressions.add(_db.expensesTable.expenseDate.isBiggerOrEqualValue(dateFrom));
      }
      if (dateTo != null) {
        expressions.add(_db.expensesTable.expenseDate.isSmallerOrEqualValue(dateTo));
      }
      if (expenseType != null) {
        expressions.add(_db.expensesTable.expenseType.equals(expenseType.name));
      }
      if (expressions.isNotEmpty) {
        select.where((e) => expressions.reduce((a, b) => a & b));
      }
      final query = select
        ..orderBy([(e) => OrderingTerm.desc(e.expenseDate)])
        ..limit(pageSize, offset: (pageNumber - 1) * pageSize);
      final rows = await query.get();
      final expenses = rows.map((e) => e.toEntity()).toList();
      _logger.i('Expenses retrieved from local DB: ${expenses.length}');
      return expenses;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve expenses from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<Expense?> getExpenseById(String id) async {
    try {
      final row = await (_db.select(_db.expensesTable)
            ..where((e) => e.id.equals(id)))
          .getSingleOrNull();
      _logger.i('Expense retrieved from local DB by id: $id');
      return row?.toEntity();
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve expense from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addExpense(Expense expense) async {
    try {
      await _db.into(_db.expensesTable).insert(
            expense.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
      _logger.i('Expense added to local DB: ${expense.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add expense to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddExpenses(List<Expense> expenses) async {
    try {
      await _db.batch((b) {
        for (final expense in expenses) {
          b.insert(
            _db.expensesTable,
            expense.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i('Bulk added expenses to local DB: ${expenses.length}');
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add expenses to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> getTotalExpensesCount() async {
    try {
      final count = _db.expensesTable.id.count();
      final query = _db.selectOnly(_db.expensesTable)..addColumns([count]);
      final row = await query.getSingle();
      final total = row.read(count) ?? 0;
      _logger.i('Total expenses count from local DB: $total');
      return total;
    } catch (e, st) {
      _logger.e(
        'Failed to get total expenses count from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteExpenseById(String id) async {
    try {
      final deleted = await (_db.delete(_db.expensesTable)
            ..where((e) => e.id.equals(id)))
          .go();
      _logger.i('Deleted expense from local DB by id: $id ($deleted rows)');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete expense from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteExpenses(List<Expense> expenses) async {
    try {
      final deleted = await (_db.delete(_db.expensesTable)
            ..where((e) => e.id.isIn(expenses.map((x) => x.id))))
          .go();
      _logger.i(
        'Deleted expenses from local DB: ${expenses.length} ($deleted rows)',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete expenses from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteExpenses() async {
    try {
      final deleted = await (_db.delete(_db.expensesTable)).go();
      _logger.i('Bulk deleted all expenses from local DB: $deleted rows');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete expenses from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
