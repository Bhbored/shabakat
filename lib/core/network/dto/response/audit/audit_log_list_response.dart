import 'package:freezed_annotation/freezed_annotation.dart';

import 'audit_log_response.dart';

part 'audit_log_list_response.freezed.dart';
part 'audit_log_list_response.g.dart';

@freezed
sealed class AuditLogListResponse with _$AuditLogListResponse {
  const factory AuditLogListResponse({
    @Default([]) List<AuditLogResponse> data,
    @Default(0) int totalCount,
    @Default(1) int pageNumber,
    @Default(20) int pageSize,
    @Default(0) int totalPages,
    @Default(false) bool hasPreviousPage,
    @Default(false) bool hasNextPage,
  }) = _AuditLogListResponse;

  factory AuditLogListResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditLogListResponseFromJson(json);
}
