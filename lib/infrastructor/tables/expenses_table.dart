import 'package:drift/drift.dart';

class Expenses extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  RealColumn get fuelExpense => real()();
  RealColumn get maintenanceExpenses => real()();
  RealColumn get employeesExpenses => real()();
  DateTimeColumn get expenseDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
