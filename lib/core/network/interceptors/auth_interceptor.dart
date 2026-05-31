import 'package:dio/dio.dart';
import 'package:shabakat/core/storage/secure_storage/secure_storage_android.dart';

class AuthInterceptor extends Interceptor {
  SecureStorageAndroid secureStorage = SecureStorageAndroid();
  static String? accessToken;
  AuthInterceptor() {
    _loadAccessToken();
  }

  void _loadAccessToken() async {
    accessToken = await secureStorage.getValue('access_token');
  }

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
