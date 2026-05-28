import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final logger = Logger();

  RetryInterceptor({required this.dio, this.maxRetries = 2});
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final extra = err.requestOptions.extra;
    final attempt = (extra['retryCount'] as int?) ?? 0;

    final isRetryable =
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode ?? 0) >= 500;

    if (isRetryable && attempt < maxRetries) {
      logger.i('Retrying ${err.requestOptions.path} - attempt ${attempt + 1}');
      await Future.delayed(Duration(seconds: attempt + 1));

      final options = err.requestOptions.copyWith(
        extra: {...extra, 'retryCount': attempt + 1},
      );

      try {
        final response = await dio.fetch(options);
        handler.resolve(response);
        return;
      } on DioException catch (e) {
        logger.e('Retry Failed : ${e.message}');
        handler.next(e);
        return;
      }
    }

    handler.next(err);
  }
}
