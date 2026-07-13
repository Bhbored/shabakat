import 'package:drift/drift.dart';
import 'customer_table.dart';

@TableIndex(name: 'idx_invoice_customer_id', columns: {#customerId})
@TableIndex(name: 'idx_invoice_invoice_status', columns: {#invoiceStatus})
@TableIndex(name: 'idx_invoice_issue_date', columns: {#issueDate})
@TableIndex(name: 'idx_invoice_due_date', columns: {#dueDate})
@DataClassName('Invoice')
class Invoices extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get customerId =>
      text().references(Customers, #id, onDelete: KeyAction.cascade)();
  TextColumn get customerName => text().nullable()();
  IntColumn get invoiceNumber => integer()();
  DateTimeColumn get issueDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get fixedCharge => real()();
  RealColumn get tva => real()();
  RealColumn get totalAmount => real()();
  RealColumn get paidAmount => real()();
  RealColumn get amountDue => real()();
  RealColumn get billedConsumption => real().nullable()();
  TextColumn get invoiceStatus =>
      text().withDefault(const Constant('unpaid'))();

  @override
  Set<Column> get primaryKey => {id};
}
