// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLogFilterRequest _$AuditLogFilterRequestFromJson(
  Map<String, dynamic> json,
) => _AuditLogFilterRequest(
  action: $enumDecodeNullable(_$AuditActionEnumMap, json['action']),
  status: $enumDecodeNullable(_$AuditLogStatusEnumMap, json['status']),
  createdFrom: _dateOnlyFromJson(json['createdFrom'] as String?),
  createdTo: _dateOnlyFromJson(json['createdTo'] as String?),
  pageNumber: (json['pageNumber'] as num?)?.toInt() ?? 1,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
);

Map<String, dynamic> _$AuditLogFilterRequestToJson(
  _AuditLogFilterRequest instance,
) => <String, dynamic>{
  'action': _$AuditActionEnumMap[instance.action],
  'status': _$AuditLogStatusEnumMap[instance.status],
  'createdFrom': _dateOnlyToJson(instance.createdFrom),
  'createdTo': _dateOnlyToJson(instance.createdTo),
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
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
