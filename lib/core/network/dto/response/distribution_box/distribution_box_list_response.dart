import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/network/dto/response/distribution_box/distribution_box_response.dart';

part 'distribution_box_list_response.freezed.dart';
part 'distribution_box_list_response.g.dart';

@freezed
sealed class DistributionBoxListResponse with _$DistributionBoxListResponse {
  const factory DistributionBoxListResponse({
    @Default([]) List<DistributionBoxResponse> data,
    @Default(0) int totalCount,
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
    @Default(0) int totalPages,
    @Default(false) bool hasPreviousPage,
    @Default(false) bool hasNextPage,
  }) = _DistributionBoxListResponse;

  factory DistributionBoxListResponse.fromJson(Map<String, dynamic> json) =>
      _$DistributionBoxListResponseFromJson(json);
}
