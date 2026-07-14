import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/services.dart';
import 'package:shabakat/data/repositories/repositories.dart';
import 'package:shabakat/domain/mappers/area/area_mapper.dart';
import 'package:shabakat/domain/mappers/customer/customer_mapper.dart';
import 'package:shabakat/domain/mappers/distribution_box/distribution_box_mapper.dart';
import 'package:shabakat/domain/mappers/expense/expense_mapper.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';
import 'package:shabakat/domain/mappers/meter/meter_reading_mapper.dart';

part 'offline_syncer.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(retry: retry)
OfflineSyncer offlineSyncer(Ref ref) {
  return OfflineSyncer(
    customerRepo: ref.read(customerRepoProvider),
    invoiceRepo: ref.read(invoiceRepoProvider),
    meterReadingRepo: ref.read(meterReadingRepoProvider),
    expenseRepo: ref.read(expenseRepoProvider),
    areaRepo: ref.read(areaRepoProvider),
    distributionBoxRepo: ref.read(distributionBoxRepoProvider),
    customerService: ref.read(customerServiceProvider),
    invoiceService: ref.read(invoiceServiceProvider),
    meterReadingService: ref.read(meterReadingServiceProvider),
    expenseService: ref.read(expenseServiceProvider),
    areaService: ref.read(areaServiceProvider),
    distributionBoxService: ref.read(distributionBoxServiceProvider),
  );
}

class OfflineSyncer {
  late final CustomerRepo _customerRepo;
  late final InvoiceRepo _invoiceRepo;
  late final MeterReadingRepo _meterReadingRepo;
  late final ExpenseRepo _expenseRepo;
  late final AreaRepo _areaRepo;
  late final DistributionBoxRepo _distributionBoxRepo;

  late final CustomerService _customerService;
  late final InvoiceService _invoiceService;
  late final MeterReadingService _meterReadingService;
  late final ExpenseService _expenseService;
  late final AreaService _areaService;
  late final DistributionBoxService _distributionBoxService;

  final _progressController = StreamController<double>.broadcast();

  Stream<double> get progressStream => _progressController.stream;

  OfflineSyncer({
    required CustomerRepo customerRepo,
    required InvoiceRepo invoiceRepo,
    required MeterReadingRepo meterReadingRepo,
    required ExpenseRepo expenseRepo,
    required AreaRepo areaRepo,
    required DistributionBoxRepo distributionBoxRepo,
    required CustomerService customerService,
    required InvoiceService invoiceService,
    required MeterReadingService meterReadingService,
    required ExpenseService expenseService,
    required AreaService areaService,
    required DistributionBoxService distributionBoxService,
  }) : _customerRepo = customerRepo,
       _invoiceRepo = invoiceRepo,
       _meterReadingRepo = meterReadingRepo,
       _expenseRepo = expenseRepo,
       _areaRepo = areaRepo,
       _distributionBoxRepo = distributionBoxRepo,
       _customerService = customerService,
       _invoiceService = invoiceService,
       _meterReadingService = meterReadingService,
       _expenseService = expenseService,
       _areaService = areaService,
       _distributionBoxService = distributionBoxService;

  void updateSyncProgress(double progress) {
    _progressController.add(progress);
  }

  Future<void> sync() async {
    try {
      updateSyncProgress(0.0);
      await _clearLocalCache();
      updateSyncProgress(0.15);

      final areas = await _areaService.getAreas();
      await _areaRepo.bulkAddAreas(areas.map((e) => e.toEntity()).toList());
      updateSyncProgress(0.3);

      final boxes = await _distributionBoxService
          .getAllDistributionBoxesUnpaged();
      await _distributionBoxRepo.bulkAddDistributionBoxes(
        boxes.map((e) => e.toEntity()).toList(),
      );
      updateSyncProgress(0.45);

      final customers = await _customerService.getAllCustomersUnpaged();
      await _customerRepo.bulkAddCustomers(
        customers.map((e) => e.toEntity()).toList(),
      );
      updateSyncProgress(0.6);

      final invoices = await _invoiceService.getAllInvoicesUnpaged();
      await _invoiceRepo.bulkAddInvoices(
        invoices.map((e) {
          final invoice = e.toEntity();
          final customerId = invoice.customerId.isNotEmpty
              ? invoice.customerId
              : (e.payments.isNotEmpty ? e.payments.first.customerId : '');
          return invoice.copyWith(customerId: customerId);
        }).toList(),
      );
      updateSyncProgress(0.75);

      final expenses = await _expenseService.getAllExpensesUnpaged();
      await _expenseRepo.bulkAddExpenses(
        expenses.map((e) => e.toEntity()).toList(),
      );
      updateSyncProgress(0.85);

      final customerIds = await _customerRepo.getCustomerIds();
      for (var i = 0; i < customerIds.length; i++) {
        final customerId = customerIds[i];
        final readings = await _meterReadingService.getMeterReadings(
          customerId,
        );
        await _meterReadingRepo.bulkAddMeterReadings(
          customerId,
          readings.map((e) => e.toEntity()).toList(),
        );
        if (customerIds.isNotEmpty) {
          updateSyncProgress(0.85 + (0.15 * (i + 1) / customerIds.length));
        }
      }

      updateSyncProgress(1.0);
    } catch (e) {
      _progressController.addError('Sync failed: $e');
      rethrow;
    }
  }

  Future<void> _clearLocalCache() async {
    await _expenseRepo.bulkDeleteExpenses();
    await _areaRepo.bulkDeleteAreas();
    await _distributionBoxRepo.bulkDeleteDistributionBoxes();
    await _customerRepo.bulkDeleteCustomers();
    await _invoiceRepo.bulkDeleteInvoices();
    await _meterReadingRepo.bulkDeleteMeterReadings();
  }
}
