import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';

part 'single_invoice_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class SingleInvoiceNotifier extends _$SingleInvoiceNotifier {
  InvoiceService get _invoiceService => ref.read(invoiceServiceProvider);
  @override
  FutureOr<Invoice> build(String invoiceId) async {
    final response = await _invoiceService.getInvoiceById(invoiceId);
    return response.toEntity();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
