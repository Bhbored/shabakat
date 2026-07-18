import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/network/dto/response/audit/audit_log_response.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';

extension AuditLogResponseMapper on AuditLogResponse {
  AuditLog toEntity() => AuditLog(
    id: id,
    action: action.toAuditAction(),
    status: status.toAuditLogStatus(),
    messageKey: messageKey,
    parameters: parameters,
    entityType: entityType.toAuditEntityTypeOrNull(),
    entityId: entityId,
    userEmail: userEmail,
    errorMessage: errorMessage,
    createdAt: createdAt,
  );
}
