// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLogResponse _$AuditLogResponseFromJson(Map<String, dynamic> json) =>
    _AuditLogResponse(
      id: json['id'] as String,
      action: json['action'] as String,
      status: json['status'] as String,
      summary: json['summary'] as String,
      entityType: json['entityType'] as String?,
      entityId: json['entityId'] as String?,
      details: json['details'] as String?,
      userEmail: json['userEmail'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AuditLogResponseToJson(_AuditLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'status': instance.status,
      'summary': instance.summary,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'details': instance.details,
      'userEmail': instance.userEmail,
      'createdAt': instance.createdAt.toIso8601String(),
    };
