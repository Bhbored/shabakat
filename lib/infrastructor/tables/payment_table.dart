import 'package:drift/drift.dart';
import 'app_user_table.dart';
import 'customer_table.dart';
import 'invoice_table.dart';

@DataClassName('Payment')
class Payments extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text().references(
    AppUsers,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get customerId => text().references(
    Customers,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  TextColumn get invoiceId => text().references(
    Invoices,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
  RealColumn get amount => real()();
  TextColumn get paymentMethod => text()();
  DateTimeColumn get paymentDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
