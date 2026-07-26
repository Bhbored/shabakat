import 'package:drift/drift.dart';
import 'customer_table.dart';

@TableIndex(name: 'idx_meter_reading_customer_id', columns: {#customerId})
@TableIndex(name: 'idx_meter_reading_created_at', columns: {#createdAt})
@DataClassName('MeterReading')
class MeterReadings extends Table {
  TextColumn get id => text()();
  TextColumn get customerId =>
      text().references(Customers, #id, onDelete: KeyAction.cascade)();
  RealColumn get readingValue => real()();
  RealColumn get consumption => real().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
