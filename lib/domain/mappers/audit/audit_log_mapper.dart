import 'dart:convert';

import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/network/dto/response/audit/audit_log_response.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';

extension AuditLogResponseMapper on AuditLogResponse {
  AuditLog toEntity() => AuditLog(
    id: id,
    action: action.toAuditAction(),
    status: status.toAuditLogStatus(),
    summary: summary,
    entityType: entityType.toAuditEntityTypeOrNull(),
    entityId: entityId,
    details: parseAuditDetails(details),
    userEmail: userEmail,
    createdAt: createdAt,
  );
}

Map<String, dynamic>? parseAuditDetails(String? raw) {
  if (raw == null || raw.trim().isEmpty) return null;

  try {
    final decoded = jsonDecode(raw);
    if (decoded is Map<String, dynamic>) return decoded;
    if (decoded is Map) return Map<String, dynamic>.from(decoded);
    return null;
  } catch (_) {
    return null;
  }
}
