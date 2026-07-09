import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution_box_response.freezed.dart';
part 'distribution_box_response.g.dart';

@freezed
sealed class DistributionBoxResponse with _$DistributionBoxResponse {
  const factory DistributionBoxResponse({
    required String id,
    required String name,
    required String areaId,
    required String areaName,
    String? locationNote,
    String? notes,
    required int customerCount,
    required DateTime createdAt,
  }) = _DistributionBoxResponse;

  factory DistributionBoxResponse.fromJson(Map<String, dynamic> json) =>
      _$DistributionBoxResponseFromJson(json);
}
