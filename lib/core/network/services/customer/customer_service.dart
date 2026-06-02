import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_add_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_update_request.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'customer_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
CustomerService customerService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return CustomerService(apiExecutor);
}

class CustomerService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  CustomerService(this._apiExecutor);

  Future<List<CustomerResponse>> getCustomers() async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'customers', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customers retrieved successfully: $data');
        final datalist = data as Map<String, dynamic>;
        final customers = (datalist['data'] as List)
            .map((x) => CustomerResponse.fromJson(x))
            .toList();
        return customers;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve customers: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<CustomerResponse> getCustomerByid(String id) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'customers/$id', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customer retrieved successfully: $data');
        return CustomerResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve customer: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> addCustomer(CustomerAddRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'customers',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customer added successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to add customer: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> updateCustomer(
    String customerId,
    CustomerUpdateRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'customers/$customerId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customer updated successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update customer: ${error.toString()}');
        throw error;
      },
    );
  }
}
