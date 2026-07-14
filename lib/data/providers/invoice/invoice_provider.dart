import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/update_invoice_request.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_skipped_response.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';

import '../../repositories/repositories.dart';
part 'invoice_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class InvoiceNotifier extends _$InvoiceNotifier {
  InvoiceService get _invoiceService => ref.read(invoiceServiceProvider);
  InvoiceFilterRequest get _filter => ref.watch(invoiceFilterProvider);
  SharedPreferencesHandler get _sharedPreferencesHandler =>
      ref.read(sharedPreferencesHandlerProvider);
  InvoiceRepo get _invoiceRepo => ref.read(invoiceRepoProvider);
  @override
  FutureOr<List<Invoice>> build() async => await _loadInvoices();

  Future<List<Invoice>> _loadInvoices() async {
    final pagination = ref.read(invoicePaginationProvider.notifier);

    final isOfflineMode = await _sharedPreferencesHandler.isOfflineMode();
    if (isOfflineMode) {
      final invoices = await _invoiceRepo.getAllInvoices(
        _filter.customerId,
        _filter.invoiceStatus,
        _filter.issueDateFrom,
        _filter.issueDateTo,
        pageNumber: _filter.pageNumber,
        pageSize: _filter.pageSize,
      );
      final totalCount = await _invoiceRepo.getTotalInvoicesCount();
      final totalPages = totalCount == 0
          ? 0
          : (totalCount / _filter.pageSize).ceil();
      pagination.updatePagination(
        InvoicePagination(
          totalCount: totalCount,
          pageNumber: _filter.pageNumber,
          pageSize: _filter.pageSize,
          totalPages: totalPages,
          hasPreviousPage: _filter.pageNumber > 1,
          hasNextPage: _filter.pageNumber < totalPages,
        ),
      );
      return invoices;
    } else {
      final invoices = await _invoiceService.getInvoices(_filter);
      pagination.updatePagination(
        InvoicePagination(
          totalCount: invoices.totalCount,
          pageNumber: invoices.pageNumber,
          pageSize: invoices.pageSize,
          totalPages: invoices.totalPages,
          hasPreviousPage: invoices.hasPreviousPage,
          hasNextPage: invoices.hasNextPage,
        ),
      );
      return invoices.data.map((x) => x.toEntity()).toList();
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await build());
  }

  Future<void> createInvoice(CreateInvoiceRequest request) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _invoiceService.createInvoice(request);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<BulkCreateInvoiceResponse> bulkCreate() async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      final response = await _invoiceService.bulkCreate();
      await refresh();
      return response;
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<List<InvoiceSkippedResponse>> getInvoiceSkipped() async {
    return await _invoiceService.getInvoiceSkipped();
  }

  Future<void> updateInvoice(
    UpdateInvoiceRequest request,
    String invoiceId,
  ) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _invoiceService.updateInvoice(invoiceId, request);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> deleteInvoice(String invoiceId) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _invoiceService.deleteInvoice(invoiceId);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> payInvoice(String invoiceId, AddPaymentRequest request) async {
    final previous = state;
    state = const AsyncValue.loading();
    try {
      await _invoiceService.payInvoice(invoiceId, request);
      await refresh();
    } catch (e, st) {
      state = previous;
      Error.throwWithStackTrace(e, st);
    }
  }
}
