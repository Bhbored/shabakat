import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/constants/api_errors.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/request/api_request.dart';
import 'package:shabakat/core/network/response/api_response.dart';

part 'api_executor.g.dart';

@riverpod
ApiExecutor apiExecutor(Ref ref, Dio dio) {
  return ApiExecutor(dio);
}

class ApiExecutor {
  final Dio _dio;

  const ApiExecutor(this._dio);
  Future<ApiResponse<T>> execute<T>(ApiRequest<T> request) async {
    try {
      final options = (request.options ?? Options()).copyWith(
        method: request.method.value,
        headers: {...?request.headers},
      );

      final response = await _dio.request(
        request.path,
        data: request.data,
        queryParameters: request.queryParams,
        options: options,
      );

      return ApiResponse.success(
        data: response.data,
        statusCode: response.statusCode,
        meta: response.data is Map ? response.data['meta'] : null,
      );
    } on DioException catch (e) {
      return ApiResponse.failure(
        error: _mapDioException(e),
        statusCode: e.response?.statusCode,
      );
    } catch (e, stack) {
      return ApiResponse.failure(
        error: ApiException(
          userMessage: ApiErrors.unknown,
          error: 'Unexpected error: $e',
          originalError: stack,
        ),
      );
    }
  }

  ApiException _mapDioException(DioException e) {
    final status = e.response?.statusCode;

    // Status code specific
    if (status == 401) {
      return ApiException(
        userMessage: 'Session expired. Please log in again.',
        error: ApiErrors.unauthorized,
        statusCode: status,
        originalError: e,
      );
    }
    if (status == 404) {
      return ApiException(
        userMessage: 'Resource not found.',
        error: ApiErrors.notFound,
        statusCode: status,
        originalError: e,
      );
    }
    if (status != null && status >= 500) {
      return ApiException(
        userMessage: 'Server error occurred. Please try again later.',
        error: ApiErrors.serverError,
        statusCode: status,
        originalError: e,
      );
    }

    return switch (e.type) {
      DioExceptionType.connectionTimeout => ApiException(
        userMessage: 'Connection timed out. Please check your internet.',
        error: ApiErrors.requestTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.receiveTimeout => ApiException(
        userMessage: 'Server took too long to respond.',
        error: ApiErrors.requestTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.sendTimeout => ApiException(
        userMessage: 'Request timed out while sending data.',
        error: ApiErrors.sendTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.cancel => ApiException(
        userMessage: 'Request was cancelled.',
        error: ApiErrors.cancelled,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.badCertificate => ApiException(
        userMessage: 'Secure connection failed.',
        error: ApiErrors.certificateFailed,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.connectionError => ApiException(
        userMessage: 'No internet connection.',
        error: ApiErrors.connectionFailed,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.badResponse => ApiException(
        userMessage: 'Invalid response from server.',
        error: ApiErrors.badResponse,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.unknown => ApiException(
        userMessage: e.message ?? 'An unexpected error occurred.',
        error: ApiErrors.unknown,
        statusCode: status,
        originalError: e,
      ),
    };
  }
}
