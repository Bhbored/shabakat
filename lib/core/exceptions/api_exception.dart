import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_exception.freezed.dart';

@freezed
sealed class ApiException with _$ApiException {
  const factory ApiException({
    required String userMessage,
    required String error,
    int? statusCode,
    required dynamic originalError,
  }) = _ApiException;

  @override
  String toString() =>
      'ApiException[$error]: $userMessage (status: $statusCode)';
}
