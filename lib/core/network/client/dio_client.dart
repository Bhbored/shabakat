import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/interceptors/app_version_interceptor.dart';
import 'package:shabakat/core/network/interceptors/auth_interceptor.dart';
import 'package:shabakat/core/network/interceptors/retry_interceptor.dart';
import 'package:shabakat/core/network/services/auth/token_store.dart';
part 'dio_client.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
DioClient dioClient(
  Ref ref,
  Map<String, String>? headers, {
  required String endpoint,
}) {
  final header = <String, dynamic>{...?headers};
  final tokenStore = ref.watch(authTokenStoreProvider);
  return DioClient(headers: header, endpoint: endpoint, tokenStore: tokenStore);
}

class DioClient {
  late final Dio dio;
  final Map<String, dynamic> headers;
  bool enableLogging;
  String endpoint;
  final TokenStore? tokenStore;
  DioClient({
    required this.headers,
    this.enableLogging = true,
    required this.endpoint,
    this.tokenStore,
  }) {
    dio = Dio(
      BaseOptions(
        // baseUrl: 'https://10.0.2.2:7076/api/v1.0/$endpoint',
        // baseUrl: 'https://192.168.1.2:7076/api/v1.0/$endpoint',
        baseUrl: 'https://shabakatlb.com/api/v1.0/$endpoint',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: headers,
      ),
    );
    if (kDebugMode) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        },
      );
    }
    dio.interceptors.add(AppVersionInterceptor());
    if (tokenStore != null) {
      dio.interceptors.add(AuthInterceptor(tokenStore!));
      dio.interceptors.add(RetryInterceptor(dio: dio, maxRetries: 2));
      if (enableLogging && kDebugMode) {
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
}
