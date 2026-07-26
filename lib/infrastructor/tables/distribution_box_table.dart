import 'package:drift/drift.dart';
import 'area_table.dart';

@TableIndex(name: 'idx_distribution_box_area_id', columns: {#areaId})
@DataClassName('DistributionBox')
class DistributionBoxes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get areaId =>
      text().references(Areas, #id, onDelete: KeyAction.cascade)();
  TextColumn get areaName => text()();
  TextColumn get locationNote => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get customerCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
