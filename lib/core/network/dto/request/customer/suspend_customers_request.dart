import 'package:freezed_annotation/freezed_annotation.dart';

part 'suspend_customers_request.freezed.dart';
part 'suspend_customers_request.g.dart';

@freezed
sealed class SuspendCustomersRequest with _$SuspendCustomersRequest {
  const factory SuspendCustomersRequest({
    required List<String> customerIds,
  }) = _SuspendCustomersRequest;

  factory SuspendCustomersRequest.fromJson(Map<String, dynamic> json) =>
      _$SuspendCustomersRequestFromJson(json);
}
