import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_profile_response.freezed.dart';
part 'get_profile_response.g.dart';

@freezed
sealed class GetProfileResponse with _$GetProfileResponse {
  const factory GetProfileResponse({
    required String name,
    String? logoUrl,
  }) = _GetProfileResponse;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}
