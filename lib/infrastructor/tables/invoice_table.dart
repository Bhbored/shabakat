import 'package:drift/drift.dart';

class Invoices extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  TextColumn get customerId => text()();
  DateTimeColumn get issueDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get fixedCharge => real()();
  RealColumn get tva => real()();
  RealColumn get totalAmount => real()();
  RealColumn get paidAmount => real()();
  RealColumn get amountDue => real()();
  TextColumn get invoiceStatus =>
      text().withDefault(const Constant('unpaid'))();

  @override
  Set<Column> get primaryKey => {id};
}
