import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/update_invoice_request.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';
part 'invoice_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class InvoiceNotifier extends _$InvoiceNotifier {
  InvoiceService get _invoiceService => ref.read(invoiceServiceProvider);
  InvoiceFilterRequest get _filter => ref.watch(invoiceFilterProvider);
  @override
  FutureOr<List<Invoice>> build() async => await _loadInvoices();

  Future<List<Invoice>> _loadInvoices() async {
    final invoices = await _invoiceService.getInvoices(_filter);
    final pagination = ref.read(invoicePaginationProvider.notifier);
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

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> createInvoice(CreateInvoiceRequest request) async {
    state = AsyncValue.loading();
    await _invoiceService.createInvoice(request);
    await refresh();
  }

  Future<BulkCreateInvoiceResponse> bulkCreate() async {
    state = AsyncValue.loading();
    final response = await _invoiceService.bulkCreate();
    await refresh();
    return response;
  }

  Future<void> updateInvoice(
    UpdateInvoiceRequest request,
    String invoiceId,
  ) async {
    state = AsyncValue.loading();
    await _invoiceService.updateInvoice(invoiceId, request);
    await refresh();
  }

  Future<void> deleteInvoice(String invoiceId) async {
    state = AsyncValue.loading();
    await _invoiceService.deleteInvoice(invoiceId);
    await refresh();
  }

  Future<void> payInvoice(String invoiceId, AddPaymentRequest request) async {
    state = AsyncValue.loading();
    await _invoiceService.payInvoice(invoiceId, request);
    await refresh();
  }
}
