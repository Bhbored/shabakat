import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  static String? accessToken;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (accessToken != null && accessToken!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token refresh or logout logic
      // In production, use QueuedInterceptor for refresh
    }
    handler.next(err);
  }
}
