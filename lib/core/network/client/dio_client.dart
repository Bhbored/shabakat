import 'dart:io';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/interceptors/retry_interceptor.dart';
part 'dio_client.g.dart';

@riverpod
DioClient dioClient(
  Ref ref,
  Map<String, String>? headers, {
  required String endpoint,
}) {
  final header = <String, dynamic>{'X-Client-Version': '1.0.0'};
  header.addAll(headers ?? {});
  return DioClient(headers: header, endpoint: endpoint);
}

class DioClient {
  late final Dio dio;
  final Map<String, dynamic> headers;
  bool enableLogging;
  String endpoint;
  DioClient({
    required this.headers,
    this.enableLogging = true,
    required this.endpoint,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://10.0.2.2:7076/api/v1.0/$endpoint',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: headers,
      ),
    );
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    dio.interceptors.add(RetryInterceptor(dio: dio, maxRetries: 2));
    if (enableLogging) {
      dio.interceptors.add(
        AwesomeDioInterceptor(
          logRequestHeaders: true,
          logResponseHeaders: true,
          logRequestTimeout: true,
        ),
      );
    }
  }
}
