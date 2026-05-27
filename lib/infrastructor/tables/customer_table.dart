import 'package:drift/drift.dart';

class Customers extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get customerType => text()();
  DateTimeColumn get subscriptionDate => dateTime()();
  TextColumn get customerStatus => text()();
  TextColumn get plan => text()();
  RealColumn get planValue => real()();

  @override
  Set<Column> get primaryKey => {id};
}
