import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'customer_filter_request.freezed.dart';
part 'customer_filter_request.g.dart';

@freezed
sealed class CustomerFilterRequest with _$CustomerFilterRequest {
  const factory CustomerFilterRequest({
    String? name,
    String? phone,
    String? areaId,
    String? boxId,
    String? ampereScheduleId,
    PlanType? planType,
    CustomerRelation? customerRelation,
    CustomerStatus? customerStatus,
    String? paymentFilter,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
  }) = _CustomerFilterRequest;

  factory CustomerFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerFilterRequestFromJson(json);
}
