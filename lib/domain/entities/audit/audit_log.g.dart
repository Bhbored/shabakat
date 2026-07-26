// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  action: $enumDecode(_$AuditActionEnumMap, json['action']),
  status: $enumDecode(_$AuditLogStatusEnumMap, json['status']),
  messageKey: json['messageKey'] as String,
  parameters: json['parameters'] as Map<String, dynamic>? ?? const {},
  entityType: $enumDecodeNullable(_$AuditEntityTypeEnumMap, json['entityType']),
  entityId: json['entityId'] as String?,
  userEmail: json['userEmail'] as String?,
  errorMessage: json['errorMessage'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'action': _$AuditActionEnumMap[instance.action]!,
  'status': _$AuditLogStatusEnumMap[instance.status]!,
  'messageKey': instance.messageKey,
  'parameters': instance.parameters,
  'entityType': _$AuditEntityTypeEnumMap[instance.entityType],
  'entityId': instance.entityId,
  'userEmail': instance.userEmail,
  'errorMessage': instance.errorMessage,
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

const _$AuditEntityTypeEnumMap = {
  AuditEntityType.customer: 'customer',
  AuditEntityType.invoice: 'invoice',
  AuditEntityType.payment: 'payment',
  AuditEntityType.expense: 'expense',
};
