import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/audit/audit_log_pagination_provider.dart';

class AuditSummaryBar extends ConsumerWidget {
  const AuditSummaryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pagination = ref.watch(auditLogPaginationProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: Row(
            children: [
              Icon(
                LucideIcons.scrollText,
                size: 18,
                color: colorScheme.primary,
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TOTAL ENTRIES',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.55),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      '${pagination.totalCount}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
