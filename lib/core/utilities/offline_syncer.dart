import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/data/repositories/repositories.dart';

part 'offline_syncer.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(retry: retry)
OfflineSyncer offlineSyncer(Ref ref) {
  return OfflineSyncer(
    ref.read(customerRepoProvider),
    ref.read(invoiceRepoProvider),
    ref.read(meterReadingRepoProvider),
    ref.read(expenseRepoProvider),
    ref.read(areaRepoProvider),
  );
}

class OfflineSyncer {
  late final CustomerRepo _customerRepo;
  late final InvoiceRepo _invoiceRepo;
  late final MeterReadingRepo _meterReadingRepo;
  late final ExpenseRepo _expenseRepo;
  late final AreaRepo _areaRepo;
  final _progressController = StreamController<double>.broadcast();

  Stream<double> get progressStream => _progressController.stream;

  OfflineSyncer(
    this._customerRepo,
    this._invoiceRepo,
    this._meterReadingRepo,
    this._expenseRepo,
    this._areaRepo,
  );

  void updateSyncProgress(double progress) {
    _progressController.add(progress);
  }

  Future<void> sync() async {
    try {
      updateSyncProgress(0.0);
      await _customerRepo.bulkDeleteCustomers();
      updateSyncProgress(0.2);
      await _invoiceRepo.bulkDeleteInvoices();
      updateSyncProgress(0.4);
      await _meterReadingRepo.bulkDeleteMeterReadings();
      updateSyncProgress(0.6);
      await _expenseRepo.bulkDeleteExpenses();
      updateSyncProgress(0.8);
      await _areaRepo.bulkDeleteAreas();
      updateSyncProgress(1.0);
    } catch (e) {
      _progressController.addError('Sync failed: $e');
    }
  }
}
