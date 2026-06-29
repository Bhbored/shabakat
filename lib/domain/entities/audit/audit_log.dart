import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

@freezed
sealed class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    required AuditAction action,
    required AuditLogStatus status,
    required String summary,
    AuditEntityType? entityType,
    String? entityId,
    Map<String, dynamic>? details,
    String? userEmail,
    required DateTime createdAt,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);
}
