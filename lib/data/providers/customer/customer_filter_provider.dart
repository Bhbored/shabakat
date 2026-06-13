import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';

part 'customer_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class CustomerFilterNotifier extends _$CustomerFilterNotifier {
  @override
  CustomerFilterRequest build() => const CustomerFilterRequest();

  void updateFilter(CustomerFilterRequest filter) {
    state = state.copyWith(
      name: filter.name,
      phone: filter.phone,
      areaId: filter.areaId,
      planType: filter.planType,
      customerRelation: filter.customerRelation,
      paymentFilter: filter.paymentFilter,
      pageNumber: filter.pageNumber,
      pageSize: filter.pageSize,
    );
  }

  void clearFilter() {
    state = const CustomerFilterRequest();
  }
}
