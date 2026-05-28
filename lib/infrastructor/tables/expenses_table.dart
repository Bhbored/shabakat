import 'package:drift/drift.dart';
import 'app_user_table.dart';

@DataClassName('Expenses')
class ExpensesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text().references(
    AppUsers,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  RealColumn get fuelExpense => real()();
  RealColumn get maintenanceExpenses => real()();
  RealColumn get employeesExpenses => real()();
  DateTimeColumn get expenseDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
