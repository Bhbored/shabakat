import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/constants/api_errors.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/request/api_request.dart';
import 'package:shabakat/core/network/response/api_response.dart';

part 'api_executor.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
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
        cancelToken: request.cancelToken,
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
        error: 'Session expired. Please log in again.',
        userMessage: ApiErrors.unauthorized,
        statusCode: status,
        originalError: e,
      );
    }
    if (status == 404) {
      return ApiException(
        error: 'Resource not found.',
        userMessage: ApiErrors.notFound,
        statusCode: status,
        originalError: e,
      );
    }
    if (status != null && status >= 500) {
      return ApiException(
        error: 'Server error occurred. Please try again later.',
        userMessage: ApiErrors.serverError,
        statusCode: status,
        originalError: e,
      );
    }

    return switch (e.type) {
      DioExceptionType.connectionTimeout => ApiException(
        error: 'Connection timed out. Please check your internet.',
        userMessage: ApiErrors.requestTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.receiveTimeout => ApiException(
        error: 'Server took too long to respond.',
        userMessage: ApiErrors.receiveTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.sendTimeout => ApiException(
        error: 'Request timed out while sending data.',
        userMessage: ApiErrors.sendTimeout,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.cancel => ApiException(
        error: 'Request was cancelled.',
        userMessage: ApiErrors.cancelled,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.badCertificate => ApiException(
        error: 'Secure connection failed.',
        userMessage: ApiErrors.certificateFailed,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.connectionError => ApiException(
        error: 'No internet connection.',
        userMessage: ApiErrors.noInternet,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.badResponse => ApiException(
        error: 'Invalid response from server.',
        userMessage: ApiErrors.badResponse,
        statusCode: status,
        originalError: e,
      ),
      DioExceptionType.unknown => ApiException(
        error: e.message ?? 'An unexpected error occurred.',
        userMessage: ApiErrors.unknown,
        statusCode: status,
        originalError: e,
      ),
    };
  }
}
