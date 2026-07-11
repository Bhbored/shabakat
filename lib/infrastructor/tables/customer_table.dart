import 'package:drift/drift.dart';
import 'package:shabakat/infrastructor/tables/area_table.dart';
import 'package:shabakat/infrastructor/tables/distribution_box_table.dart';

@TableIndex(name: 'idx_customer_name', columns: {#name})
@TableIndex(name: 'idx_customer_phone', columns: {#phone})
@TableIndex(name: 'idx_customer_area_id', columns: {#areaId})
@TableIndex(name: 'idx_customer_box_id', columns: {#boxId})
@TableIndex(name: 'idx_customer_plan', columns: {#plan})
@TableIndex(
  name: 'idx_customer_customer_relation',
  columns: {#customerRelation},
)
@TableIndex(name: 'idx_customer_customer_status', columns: {#customerStatus})
@DataClassName('Customer')
class Customers extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get name => text()();
  RealColumn get totalBilled => real().nullable()();
  RealColumn get totalPaid => real().nullable()();
  RealColumn get totalOutstanding => real().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get building => text().nullable()();
  TextColumn get floor => text().nullable()();
  TextColumn get cableName => text().nullable()();
  TextColumn get boxId =>
      text().nullable().references(DistributionBoxes, #id)();
  TextColumn get boxName => text().nullable()();
  TextColumn get ampereScheduleId => text().nullable()();
  TextColumn get ampereScheduleName => text().nullable()();
  TextColumn get areaName => text().nullable()();
  TextColumn get areaId => text().nullable().references(Areas, #id)();
  TextColumn get customerType => text()();
  TextColumn get customerRelation => text().nullable()();
  DateTimeColumn get subscriptionDate => dateTime()();
  RealColumn get priceOverride => real().nullable()();
  RealColumn get fixedChargeOverride => real().nullable()();
  RealColumn get tvaOverride => real().nullable()();
  BoolColumn get hasPricingOverride =>
      boolean().withDefault(const Constant(false))();
  TextColumn get customerStatus =>
      text().withDefault(const Constant('active'))();
  TextColumn get plan => text()();
  RealColumn get planValue => real()();

  @override
  Set<Column> get primaryKey => {id};
}
