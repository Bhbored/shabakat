import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/bulk_create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/update_invoice_request.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';
part 'invoice_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class InvoiceNotifier extends _$InvoiceNotifier {
  InvoiceService get _invoiceService => ref.read(invoiceServiceProvider);

  @override
  FutureOr<List<Invoice>> build() async => await _loadInvoices();

  Future<List<Invoice>> _loadInvoices() async {
    final invoices = await _invoiceService.getInvoices(
      InvoiceFilterRequest(),
    );
    return invoices.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _loadInvoices());
  }

  Future<void> createInvoice(CreateInvoiceRequest request) async {
    await _invoiceService.createInvoice(request);
    await refresh();
  }

  Future<void> bulkCreate(BulkCreateInvoiceRequest request) async {
    await _invoiceService.bulkCreate(request);
    await refresh();
  }

  Future<void> updateInvoice(
    UpdateInvoiceRequest request,
    String invoiceId,
  ) async {
    await _invoiceService.updateInvoice(invoiceId, request);
    await refresh();
  }

  Future<void> deleteInvoice(String invoiceId) async {
    await _invoiceService.deleteInvoice(invoiceId);
    await refresh();
  }

  Future<void> payInvoice(
    String invoiceId,
    AddPaymentRequest request,
  ) async {
    await _invoiceService.payInvoice(invoiceId, request);
    await refresh();
  }
}
