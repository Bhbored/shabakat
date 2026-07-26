import 'package:drift/drift.dart';

@TableIndex(name: 'idx_expense_expense_type', columns: {#expenseType})
@TableIndex(name: 'idx_expense_expense_date', columns: {#expenseDate})
@DataClassName('Expense')
class ExpensesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get expenseType => text()();
  DateTimeColumn get expenseDate => dateTime()();
  RealColumn get amount => real()();
  TextColumn get label => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
