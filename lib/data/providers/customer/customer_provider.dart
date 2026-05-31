import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_add_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_update_request.dart';
import 'package:shabakat/core/network/services/customer/customer_service.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/customer_mapper.dart';
part 'customer_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class CustomerNotifier extends _$CustomerNotifier {
  CustomerService get _customerService => ref.read(customerServiceProvider);

  @override
  FutureOr<List<Customer>> build() async => await _loadCustomers();

  Future<List<Customer>> _loadCustomers() async {
    final customers = await _customerService.getCustomers();
    return customers.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _loadCustomers());
  }

  Future<void> addCustomer(CustomerAddRequest request) async {
    await _customerService.addCustomer(request);
    await refresh();
  }

  Future<void> updateCustomer(
    CustomerUpdateRequest customer,
    String customerId,
  ) async {
    await _customerService.updateCustomer(customerId, customer);
    await refresh();
  }
}
