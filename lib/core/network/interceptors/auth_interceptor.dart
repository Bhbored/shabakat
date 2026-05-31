import 'package:dio/dio.dart';
import 'package:shabakat/core/network/services/auth/token_store.dart';

class AuthInterceptor extends Interceptor {
  final TokenStore _tokenStore;
  AuthInterceptor(this._tokenStore);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStore.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
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
