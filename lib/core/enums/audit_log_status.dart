import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/themes/app_colors.dart';

@JsonEnum(alwaysCreate: true)
enum AuditLogStatus { success, failed }

extension AuditLogStatusX on AuditLogStatus {
  String get label => switch (this) {
    AuditLogStatus.success => 'audit.status.success'.tr(),
    AuditLogStatus.failed => 'audit.status.failed'.tr(),
  };

  IconData get icon => switch (this) {
    AuditLogStatus.success => LucideIcons.checkCircle2,
    AuditLogStatus.failed => LucideIcons.xCircle,
  };

  Color get statusColor => switch (this) {
    AuditLogStatus.success => AppColors.success,
    AuditLogStatus.failed => AppColors.error,
  };
}

extension StringToAuditLogStatus on String {
  AuditLogStatus toAuditLogStatus() => switch (toLowerCase()) {
    'success' => AuditLogStatus.success,
    'failed' => AuditLogStatus.failed,
    _ => AuditLogStatus.failed,
  };
}
