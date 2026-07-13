import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/data/repositories/area_repo.dart';
import 'package:shabakat/data/repositories/customer_repo.dart';
import 'package:shabakat/data/repositories/distribution_box_repo.dart';
import 'package:shabakat/data/repositories/expense_repo.dart';
import 'package:shabakat/data/repositories/invoice_repo.dart';
import 'package:shabakat/data/repositories/meter_reading_repo.dart';
import 'package:shabakat/infrastructor/db/database.dart';

part 'repositories_provider.g.dart';

Duration? retry(int _, Object _) => null;
@Riverpod(retry: retry)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(retry: retry)
AreaRepo areaRepo(Ref ref) => AreaRepo(ref.watch(appDatabaseProvider));

@Riverpod(retry: retry)
CustomerRepo customerRepo(Ref ref) =>
    CustomerRepo(ref.watch(appDatabaseProvider));

@Riverpod(retry: retry)
DistributionBoxRepo distributionBoxRepo(Ref ref) =>
    DistributionBoxRepo(ref.watch(appDatabaseProvider));

@Riverpod(retry: retry)
ExpenseRepo expenseRepo(Ref ref) => ExpenseRepo(ref.watch(appDatabaseProvider));

@Riverpod(retry: retry)
InvoiceRepo invoiceRepo(Ref ref) => InvoiceRepo(ref.watch(appDatabaseProvider));

@Riverpod(retry: retry)
MeterReadingRepo meterReadingRepo(Ref ref) =>
    MeterReadingRepo(ref.watch(appDatabaseProvider));
