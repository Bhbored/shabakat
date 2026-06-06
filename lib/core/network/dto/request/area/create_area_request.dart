import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_area_request.freezed.dart';
part 'create_area_request.g.dart';

@freezed
sealed class CreateAreaRequest with _$CreateAreaRequest {
  const factory CreateAreaRequest({
    required String name,
  }) = _CreateAreaRequest;

  factory CreateAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAreaRequestFromJson(json);
}
