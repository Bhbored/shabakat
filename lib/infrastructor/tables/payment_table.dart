import 'package:drift/drift.dart';

class Payments extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  TextColumn get customerId => text()();
  TextColumn get invoiceId => text()();
  RealColumn get amount => real()();
  TextColumn get paymentMethod => text()();
  DateTimeColumn get paymentDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
