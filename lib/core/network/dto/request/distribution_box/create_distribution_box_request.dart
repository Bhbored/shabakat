import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_distribution_box_request.freezed.dart';
part 'create_distribution_box_request.g.dart';

@freezed
sealed class CreateDistributionBoxRequest with _$CreateDistributionBoxRequest {
  const factory CreateDistributionBoxRequest({
    required String name,
    required String areaId,
    String? locationNote,
    String? notes,
  }) = _CreateDistributionBoxRequest;

  factory CreateDistributionBoxRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDistributionBoxRequestFromJson(json);
}
