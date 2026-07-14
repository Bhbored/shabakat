import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/customer/customer_service.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/customer/customer_mapper.dart';

import '../../repositories/repositories.dart';

part 'single_customer_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class SingleCustomer extends _$SingleCustomer {
  CustomerService get _customerService => ref.read(customerServiceProvider);
  SharedPreferencesHandler get _sharedPreferencesHandler =>
      ref.read(sharedPreferencesHandlerProvider);
  CustomerRepo get _customerRepo => ref.read(customerRepoProvider);
  @override
  FutureOr<Customer> build(String customerId) async {
    final isOfflineMode = await _sharedPreferencesHandler.isOfflineMode();
    if (isOfflineMode) {
      final customer = await _customerRepo.getCustomerById(customerId);
      return customer ?? Customer.empty();
    } else {
      final response = await _customerService.getCustomerByid(customerId);
      return response.toEntity();
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
