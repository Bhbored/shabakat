import 'package:drift/drift.dart';
import 'customer_table.dart';
import 'invoice_table.dart';

@TableIndex(name: 'idx_payment_customer_id', columns: {#customerId})
@TableIndex(name: 'idx_payment_invoice_id', columns: {#invoiceId})
@TableIndex(name: 'idx_payment_payment_date', columns: {#paymentDate})
@DataClassName('Payment')
class Payments extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get customerId => text().references(Customers, #id)();
  TextColumn get invoiceId => text().references(Invoices, #id)();
  RealColumn get amount => real()();
  TextColumn get paymentMethod => text()();
  DateTimeColumn get paymentDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
