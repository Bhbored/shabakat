import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';

part 'customer_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class CustomerFilterNotifier extends _$CustomerFilterNotifier {
  @override
  CustomerFilterRequest build() => const CustomerFilterRequest();

  void updateFilter(CustomerFilterRequest filter) {
    state = state.copyWith(
      name: filter.name,
      phone: filter.phone,
      areaId: filter.areaId,
      boxId: filter.boxId,
      planType: filter.planType,
      customerRelation: filter.customerRelation,
      customerStatus: filter.customerStatus,
      paymentFilter: filter.paymentFilter,
      pageNumber: filter.pageNumber,
      pageSize: filter.pageSize,
    );
  }

  void clearFilter() {
    state = const CustomerFilterRequest();
  }

  void nextPage() {
    state = state.copyWith(pageNumber: state.pageNumber + 1);
  }

  void previousPage() {
    state = state.copyWith(pageNumber: state.pageNumber - 1);
  }

  void firstPage() {
    state = state.copyWith(pageNumber: 1);
  }

  void lastPage() {
    state = state.copyWith(
      pageNumber: ref.read(customerPaginationProvider).totalPages,
    );
  }
}
