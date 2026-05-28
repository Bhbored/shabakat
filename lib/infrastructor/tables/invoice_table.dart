import 'package:drift/drift.dart';
import 'app_user_table.dart';
import 'customer_table.dart';

@DataClassName('Invoice')
class Invoices extends Table {
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
  DateTimeColumn get issueDate => dateTime()();
  DateTimeColumn get dueDate => dateTime()();
  RealColumn get fixedCharge => real()();
  RealColumn get tva => real()();
  RealColumn get totalAmount => real()();
  RealColumn get paidAmount => real()();
  RealColumn get amountDue => real()();
  // TextColumn get sku => text().clientDefault(
  //   () => 'SKU-${DateTime.now().millisecondsSinceEpoch}',
  // )();
  TextColumn get invoiceStatus =>
      text().withDefault(const Constant('unpaid'))();

  @override
  Set<Column> get primaryKey => {id};
}
