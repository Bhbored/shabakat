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
      messageKey: json['messageKey'] as String,
      parameters: json['parameters'] as Map<String, dynamic>? ?? const {},
      entityType: json['entityType'] as String?,
      entityId: json['entityId'] as String?,
      userEmail: json['userEmail'] as String?,
      errorMessage: json['errorMessage'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AuditLogResponseToJson(_AuditLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'status': instance.status,
      'messageKey': instance.messageKey,
      'parameters': instance.parameters,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'userEmail': instance.userEmail,
      'errorMessage': instance.errorMessage,
      'createdAt': instance.createdAt.toIso8601String(),
    };
