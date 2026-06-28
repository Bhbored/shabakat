// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  action: $enumDecode(_$AuditActionEnumMap, json['action']),
  status: $enumDecode(_$AuditLogStatusEnumMap, json['status']),
  summary: json['summary'] as String,
  entityType: json['entityType'] as String?,
  entityId: json['entityId'] as String?,
  details: json['details'] as String?,
  userEmail: json['userEmail'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'action': _$AuditActionEnumMap[instance.action]!,
  'status': _$AuditLogStatusEnumMap[instance.status]!,
  'summary': instance.summary,
  'entityType': instance.entityType,
  'entityId': instance.entityId,
  'details': instance.details,
  'userEmail': instance.userEmail,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$AuditActionEnumMap = {
  AuditAction.customerCreated: 'customerCreated',
  AuditAction.customerUpdated: 'customerUpdated',
  AuditAction.customerDeleted: 'customerDeleted',
  AuditAction.invoiceCreated: 'invoiceCreated',
  AuditAction.invoiceBulkCreated: 'invoiceBulkCreated',
  AuditAction.invoicePaymentRecorded: 'invoicePaymentRecorded',
  AuditAction.invoiceFixedKilowattCharge: 'invoiceFixedKilowattCharge',
  AuditAction.expenseCreated: 'expenseCreated',
  AuditAction.expenseUpdated: 'expenseUpdated',
  AuditAction.expenseDeleted: 'expenseDeleted',
};

const _$AuditLogStatusEnumMap = {
  AuditLogStatus.success: 'success',
  AuditLogStatus.failed: 'failed',
};
