import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import 'audit_log_detail_formatters.dart';

class AuditLogEventDataSection extends StatelessWidget {
  final Map<String, dynamic>? details;

  const AuditLogEventDataSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(LucideIcons.listTree, size: 16, color: colorScheme.primary),
            SizedBox(width: context.paddingSmall),
            Text(
              'audit.details.event_data'.tr(),
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                color: colorScheme.onSurface.withValues(alpha: 0.45),
              ),
            ),
            SizedBox(width: context.spaceMedium),
            Expanded(child: Divider(color: colorScheme.outline)),
            if (details != null && details!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: context.paddingSmall),
                child: Text(
                  '${details!.length}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: context.spaceMedium),
        if (details == null || details!.isEmpty)
          const _AuditLogEmptyEventData()
        else
          Card(
            child: Column(
              children: [
                for (var i = 0; i < details!.length; i++)
                  _AuditLogEventDataRow(
                    label: formatAuditDetailKey(details!.keys.elementAt(i)),
                    value: formatAuditDetailValue(details!.values.elementAt(i)),
                    isLast: i == details!.length - 1,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _AuditLogEmptyEventData extends StatelessWidget {
  const _AuditLogEmptyEventData();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(context.borderRadiusLarge),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6)),
      ),
      child: Column(
        children: [
          Icon(
            LucideIcons.inbox,
            size: 28,
            color: colorScheme.onSurface.withValues(alpha: 0.35),
          ),
          SizedBox(height: context.paddingSmall * 0.5),
          Text(
            'audit.details.no_event_data'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.55),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuditLogEventDataRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _AuditLogEventDataRow({
    required this.label,
    required this.value,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingMedium,
            vertical: context.paddingSmall,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.55),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                flex: 3,
                child: SelectableText(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast) Divider(height: 1, color: colorScheme.outline),
      ],
    );
  }
}
