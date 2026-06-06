import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';

part 'customer_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class CustomerFilterNotifier extends _$CustomerFilterNotifier {
  @override
  CustomerFilterRequest build() => const CustomerFilterRequest();

  void update(CustomerFilterRequest filter) {
    state = filter;
  }

  void updateSearch({required String criteria, required String query}) {
    final q = query.trim().isEmpty ? null : query.trim();
    state = CustomerFilterRequest(
      name: criteria == 'name' ? q : null,
      phone: criteria == 'phone' ? q : null,
      areaId: criteria == 'area' ? q : null,
      planType: state.planType,
      customerRelation: state.customerRelation,
      paymentFilter: state.paymentFilter,
      pageNumber: 1,
      pageSize: state.pageSize,
    );
  }

  void updateAreaFilter(String areaId) {
    final q = areaId.trim().isEmpty ? null : areaId.trim();
    state = CustomerFilterRequest(
      areaId: q,
      pageNumber: 1,
      pageSize: state.pageSize,
    );
  }

  void updateAdvancedFilters({
    String? customerRelation,
    String? planType,
  }) {
    state = CustomerFilterRequest(
      name: state.name,
      phone: state.phone,
      areaId: state.areaId,
      planType: planType,
      customerRelation: customerRelation,
      paymentFilter: state.paymentFilter,
      pageNumber: 1,
      pageSize: state.pageSize,
    );
  }

  void updatePaymentFilter(String? paymentFilter) {
    state = CustomerFilterRequest(
      name: state.name,
      phone: state.phone,
      areaId: state.areaId,
      planType: state.planType,
      customerRelation: state.customerRelation,
      paymentFilter: paymentFilter,
      pageNumber: 1,
      pageSize: state.pageSize,
    );
  }

  void reset() {
    state = const CustomerFilterRequest();
  }
}
