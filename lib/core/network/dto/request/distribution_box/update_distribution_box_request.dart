import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_distribution_box_request.freezed.dart';
part 'update_distribution_box_request.g.dart';

@freezed
sealed class UpdateDistributionBoxRequest with _$UpdateDistributionBoxRequest {
  const factory UpdateDistributionBoxRequest({
    required String name,
    required String areaId,
    String? locationNote,
    String? notes,
  }) = _UpdateDistributionBoxRequest;

  factory UpdateDistributionBoxRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateDistributionBoxRequestFromJson(json);
}
