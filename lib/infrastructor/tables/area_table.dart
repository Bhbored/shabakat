import 'package:drift/drift.dart';

@TableIndex(name: 'idx_area_name', columns: {#name})
@DataClassName('Area')
class Areas extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get name => text()();
  IntColumn get customerCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
