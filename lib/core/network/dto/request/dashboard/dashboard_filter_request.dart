import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_filter_request.freezed.dart';
part 'dashboard_filter_request.g.dart';

@freezed
sealed class DashboardFilterRequest with _$DashboardFilterRequest {
  const DashboardFilterRequest._();

  const factory DashboardFilterRequest({
    int? year,
    int? month,
  }) = _DashboardFilterRequest;

  factory DashboardFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$DashboardFilterRequestFromJson(json);

  Map<String, dynamic> toQueryParams() {
    if (year == null && month == null) return {};
    if (year != null && month != null) {
      return {'year': year, 'month': month};
    }
    return {};
  }
}
