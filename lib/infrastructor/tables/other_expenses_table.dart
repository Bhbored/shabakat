import 'package:drift/drift.dart';
import 'app_user_table.dart';
import 'expenses_table.dart';

@DataClassName('OtherExpenses')
class OtherExpensesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text().references(
    AppUsers,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get expenseId => text().references(
    ExpensesTable,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  RealColumn get amount => real()();
  TextColumn get type => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
