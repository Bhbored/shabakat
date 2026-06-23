import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';

part 'invoice_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class InvoiceFilterNotifier extends _$InvoiceFilterNotifier {
  @override
  InvoiceFilterRequest build() => const InvoiceFilterRequest();

  void updateFilter(InvoiceFilterRequest filter) => state = filter;
  void clearFilter() => state = const InvoiceFilterRequest();
  void nextPage() => state = state.copyWith(pageNumber: state.pageNumber + 1);
  void previousPage() =>
      state = state.copyWith(pageNumber: state.pageNumber - 1);
  void firstPage() => state = const InvoiceFilterRequest(pageNumber: 1);
  void lastPage() => state = state.copyWith(
    pageNumber: ref.read(invoicePaginationProvider).totalPages,
  );
}
