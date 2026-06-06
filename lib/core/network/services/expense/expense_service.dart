import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/create_other_expense_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/expense_filter_request.dart';
import 'package:shabakat/core/network/dto/request/expenses/update_expense_request.dart';
import 'package:shabakat/core/network/dto/response/expenses/expense_response.dart';
import 'package:shabakat/core/network/dto/response/expenses/expense_summary_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'expense_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
ExpenseService expenseService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return ExpenseService(apiExecutor);
}

class ExpenseService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  ExpenseService(this._apiExecutor);

  Future<List<ExpenseSummaryResponse>> getExpenses(
    ExpenseFilterRequest filter,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'expenses',
        method: HttpMethod.get,
        queryParams: {
          if (filter.dateFrom != null) 'dateFrom': filter.dateFrom,
          if (filter.dateTo != null) 'dateTo': filter.dateTo,
          'pageNumber': filter.pageNumber,
          'pageSize': filter.pageSize,
        },
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Expenses retrieved successfully: $data');
        final datalist = data as Map<String, dynamic>;
        final expenses = (datalist['data'] as List)
            .map((x) => ExpenseSummaryResponse.fromJson(x))
            .toList();
        return expenses;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve expenses: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<ExpenseResponse> getExpenseById(String id) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'expenses/$id', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Expense retrieved successfully: $data');
        return ExpenseResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve expense: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<ExpenseResponse> createExpense(CreateExpenseRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'expenses',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Expense created successfully: $data');
        return ExpenseResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create expense: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<ExpenseResponse> updateExpense(
    String expenseId,
    UpdateExpenseRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'expenses/$expenseId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Expense updated successfully: $data');
        return ExpenseResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update expense: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteExpense(String expenseId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'expenses/$expenseId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Expense deleted successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete expense: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<ExpenseResponse> addOtherExpense(
    String expenseId,
    CreateOtherExpenseRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'expenses/$expenseId/other',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Other expense added successfully: $data');
        return ExpenseResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to add other expense: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteOtherExpense(String otherExpenseId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'otherExpenses/$otherExpenseId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Other expense deleted successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete other expense: ${error.toString()}');
        throw error;
      },
    );
  }
}
