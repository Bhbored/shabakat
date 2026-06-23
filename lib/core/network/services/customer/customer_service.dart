import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/customer/create_customer_request.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/core/network/dto/request/customer/update_customer_request.dart';
import 'package:shabakat/core/network/dto/response/customer/customer_list_summery_response.dart';
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

  Future<CustomerListSummeryResponse> getCustomers(
    CustomerFilterRequest filter,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'customers',
        method: HttpMethod.get,
        queryParams: {
          if (filter.name != null) 'name': filter.name,
          if (filter.phone != null) 'phone': filter.phone,
          if (filter.areaId != null) 'areaId': filter.areaId,
          if (filter.planType != null) 'planType': filter.planType,
          if (filter.customerRelation != null)
            'customerRelation': filter.customerRelation,
          if (filter.paymentFilter != null)
            'paymentFilter': filter.paymentFilter,
          'pageNumber': filter.pageNumber,
          'pageSize': filter.pageSize,
        },
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customers retrieved successfully: $data');
        return CustomerListSummeryResponse.fromJson(data);
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

  Future<CustomerResponse> addCustomer(CreateCustomerRequest request) async {
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
        return CustomerResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to add customer: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<CustomerResponse> updateCustomer(
    String customerId,
    UpdateCustomerRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'customers/$customerId',
        method: HttpMethod.patch,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customer updated successfully: $data');
        return CustomerResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update customer: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteCustomer(String customerId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'customers/$customerId', method: HttpMethod.delete),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Customer deleted successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete customer: ${error.toString()}');
        throw error;
      },
    );
  }
}
