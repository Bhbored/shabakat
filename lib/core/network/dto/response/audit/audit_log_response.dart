import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_response.freezed.dart';
part 'audit_log_response.g.dart';

@freezed
sealed class AuditLogResponse with _$AuditLogResponse {
  const factory AuditLogResponse({
    required String id,
    required String action,
    required String status,
    required String summary,
    String? entityType,
    String? entityId,
    String? details,
    String? userEmail,
    required DateTime createdAt,
  }) = _AuditLogResponse;

  factory AuditLogResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditLogResponseFromJson(json);
}
