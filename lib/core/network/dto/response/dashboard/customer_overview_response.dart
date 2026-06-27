import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_overview_response.freezed.dart';
part 'customer_overview_response.g.dart';

@freezed
sealed class CustomerOverviewResponse with _$CustomerOverviewResponse {
  const factory CustomerOverviewResponse({
    @Default(0) int total,
    @Default(0) int active,
    @Default(0) int suspended,
    @Default(0) int terminated,
    @Default(0) int ampereCount,
    @Default(0) int kilowattCount,
  }) = _CustomerOverviewResponse;

  factory CustomerOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerOverviewResponseFromJson(json);
}
