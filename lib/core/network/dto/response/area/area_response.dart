import 'package:freezed_annotation/freezed_annotation.dart';

part 'area_response.freezed.dart';
part 'area_response.g.dart';

@freezed
sealed class AreaResponse with _$AreaResponse {
  const factory AreaResponse({
    required String id,
    required String name,
    required int customerCount,
    required DateTime createdAt,
  }) = _AreaResponse;

  factory AreaResponse.fromJson(Map<String, dynamic> json) =>
      _$AreaResponseFromJson(json);
}
