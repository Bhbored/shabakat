import 'package:freezed_annotation/freezed_annotation.dart';

part 'suspend_customers_response.freezed.dart';
part 'suspend_customers_response.g.dart';

@freezed
sealed class SuspendCustomersResponse with _$SuspendCustomersResponse {
  const factory SuspendCustomersResponse({
    required int suspended,
    required String message,
  }) = _SuspendCustomersResponse;

  factory SuspendCustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$SuspendCustomersResponseFromJson(json);
}
