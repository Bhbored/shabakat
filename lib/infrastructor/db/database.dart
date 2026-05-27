import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shabakat/infrastructor/tables/app_user_table.dart';
import 'package:shabakat/infrastructor/tables/company_preferences_table.dart';
import 'package:shabakat/infrastructor/tables/customer_table.dart';
import 'package:shabakat/infrastructor/tables/expenses_table.dart';
import 'package:shabakat/infrastructor/tables/invoice_table.dart';
import 'package:shabakat/infrastructor/tables/other_expenses_table.dart';
import 'package:shabakat/infrastructor/tables/payment_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  AppUsers,
  CompanyPreferences,
  Customers,
  Expenses,
  Invoices,
  OtherExpenses,
  Payments,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
