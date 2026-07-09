import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution_box_filter_request.freezed.dart';
part 'distribution_box_filter_request.g.dart';

@freezed
sealed class DistributionBoxFilterRequest with _$DistributionBoxFilterRequest {
  const factory DistributionBoxFilterRequest({
    String? areaId,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
  }) = _DistributionBoxFilterRequest;

  factory DistributionBoxFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$DistributionBoxFilterRequestFromJson(json);
}
