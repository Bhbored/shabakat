import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';
import 'package:shabakat/ui/screens/audit/widgets/audit_log_details/audit_log_detail_formatters.dart';

class AuditLogDetailsHeroBackground extends StatelessWidget {
  final Color statusColor;

  const AuditLogDetailsHeroBackground({super.key, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withValues(alpha: 0.18),
            statusColor.withValues(alpha: 0.12),
            colorScheme.surface,
          ],
          stops: const [0, 0.55, 1],
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(
            top: context.paddingMedium * 3,
            right: context.paddingMedium,
          ),
          child: Icon(
            LucideIcons.sparkles,
            size: 72,
            color: colorScheme.primary.withValues(alpha: 0.08),
          ),
        ),
      ),
    );
  }
}

class AuditLogDetailsSummary extends StatelessWidget {
  final AuditLog log;
  final Color statusColor;

  const AuditLogDetailsSummary({
    super.key,
    required this.log,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        context.paddingMedium,
        context.paddingMedium,
        context.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(context.borderRadiusLarge),
        border: Border.all(color: colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: context.paddingSmall * 0.5,
            runSpacing: context.paddingSmall * 0.5,
            children: [
              _AuditLogDetailsChip(
                label: log.status.label,
                color: statusColor,
                icon: log.status.icon,
              ),
              if (log.entityType?.label case final label?)
                _AuditLogDetailsChip(
                  label: label,
                  color: colorScheme.primary,
                  icon: LucideIcons.layers,
                ),
            ],
          ),
          SizedBox(height: context.paddingSmall * 0.5),
          Text(
            formatAuditMessage(log.messageKey, log.parameters),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          if (log.errorMessage case final error? when error.trim().isNotEmpty) ...[
            SizedBox(height: context.paddingSmall),
            Text(
              error,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.error,
                fontWeight: FontWeight.w500,
                height: 1.35,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AuditLogDetailsChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const _AuditLogDetailsChip({
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.4,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          SizedBox(width: context.paddingSmall * 0.4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
