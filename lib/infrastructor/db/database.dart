import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shabakat/infrastructor/tables/area_table.dart';
import 'package:shabakat/infrastructor/tables/customer_table.dart';
import 'package:shabakat/infrastructor/tables/distribution_box_table.dart';
import 'package:shabakat/infrastructor/tables/expenses_table.dart';
import 'package:shabakat/infrastructor/tables/invoice_table.dart';
import 'package:shabakat/infrastructor/tables/meter_reading_table.dart';
import 'package:shabakat/infrastructor/tables/payment_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Areas,
    DistributionBoxes,
    Customers,
    Invoices,
    Payments,
    ExpensesTable,
    MeterReadings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {},
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON;');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
