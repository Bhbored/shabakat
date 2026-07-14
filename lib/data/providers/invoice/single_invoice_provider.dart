import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';

import '../../repositories/repositories.dart';

part 'single_invoice_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class SingleInvoiceNotifier extends _$SingleInvoiceNotifier {
  InvoiceService get _invoiceService => ref.read(invoiceServiceProvider);
  SharedPreferencesHandler get _sharedPreferencesHandler =>
      ref.read(sharedPreferencesHandlerProvider);
  InvoiceRepo get _invoiceRepo => ref.read(invoiceRepoProvider);
  @override
  FutureOr<Invoice> build(String invoiceId) async {
    final isOfflineMode = await _sharedPreferencesHandler.isOfflineMode();
    if (isOfflineMode) {
      final invoice = await _invoiceRepo.getInvoiceByIdWithPayments(invoiceId);
      return invoice ?? Invoice.empty();
    } else {
      final response = await _invoiceService.getInvoiceById(invoiceId);
      return response.toEntity();
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
