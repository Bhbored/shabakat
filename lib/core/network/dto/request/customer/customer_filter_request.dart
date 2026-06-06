import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_filter_request.freezed.dart';
part 'customer_filter_request.g.dart';

@freezed
sealed class CustomerFilterRequest with _$CustomerFilterRequest {
  const factory CustomerFilterRequest({
    String? name,
    String? phone,
    String? areaId,
    String? planType,
    String? customerRelation,
    String? paymentFilter,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
  }) = _CustomerFilterRequest;

  factory CustomerFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerFilterRequestFromJson(json);
}
