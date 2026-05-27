import 'package:drift/drift.dart';

class OtherExpenses extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  TextColumn get expenseId => text()();
  RealColumn get amount => real()();
  TextColumn get type => text()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
