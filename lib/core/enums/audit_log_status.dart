import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum AuditLogStatus { success, failed }

extension StringToAuditLogStatus on String {
  AuditLogStatus toAuditLogStatus() => switch (toLowerCase()) {
    'success' => AuditLogStatus.success,
    'failed' => AuditLogStatus.failed,
    _ => AuditLogStatus.failed,
  };
}
