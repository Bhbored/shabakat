import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_area_request.freezed.dart';
part 'update_area_request.g.dart';

@freezed
sealed class UpdateAreaRequest with _$UpdateAreaRequest {
  const factory UpdateAreaRequest({
    required String name,
  }) = _UpdateAreaRequest;

  factory UpdateAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAreaRequestFromJson(json);
}
