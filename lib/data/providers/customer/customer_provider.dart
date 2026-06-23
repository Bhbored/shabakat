import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/customer/create_customer_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/core/network/dto/request/customer/update_customer_request.dart';
import 'package:shabakat/core/network/services/customer/customer_service.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/customer/customer_mapper.dart';
part 'customer_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class CustomerNotifier extends _$CustomerNotifier {
  CustomerService get _customerService => ref.read(customerServiceProvider);

  @override
  FutureOr<List<Customer>> build() async {
    final filter = ref.watch(customerFilterProvider);
    return _loadCustomers(filter);
  }

  Future<List<Customer>> _loadCustomers(CustomerFilterRequest filter) async {
    final response = await _customerService.getCustomers(filter);
    final pagination = ref.read(customerPaginationProvider.notifier);
    pagination.updatePagination(
      CustomerPagination(
        totalCount: response.totalCount,
        pageNumber: response.pageNumber,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        hasPreviousPage: response.hasPreviousPage,
        hasNextPage: response.hasNextPage,
      ),
    );
    return response.data.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> addCustomer(CreateCustomerRequest request) async {
    await _customerService.addCustomer(request);
    await refresh();
  }

  Future<void> updateCustomer(
    UpdateCustomerRequest customer,
    String customerId,
  ) async {
    await _customerService.updateCustomer(customerId, customer);
    await refresh();
  }

  Future<void> deleteCustomer(String customerId) async {
    await _customerService.deleteCustomer(customerId);
    await refresh();
  }
}
