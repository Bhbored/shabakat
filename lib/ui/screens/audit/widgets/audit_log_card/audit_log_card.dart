import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';
import 'package:shabakat/ui/screens/audit/subscreens/audit_log_details_screen.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import 'audit_log_labels.dart';

class AuditLogCard extends StatelessWidget {
  final AuditLog log;

  const AuditLogCard({super.key, required this.log});

  String _formatDateTime(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/${date.year} · $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor = AuditLogLabels.statusColor(log.status, colorScheme);
    final entityLabel = AuditLogLabels.entityTypeLabel(log.entityType);
    final email = log.userEmail?.trim();

    final footerParts = <String>[
      ?entityLabel,
      if (email != null && email.isNotEmpty) email,
    ];

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(
            context,
          ).push(openInnerScreen(widget: AuditLogDetailsScreen(log: log)));
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: statusColor),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(context.paddingMedium),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ActionIcon(
                        icon: AuditLogLabels.actionIcon(log.action),
                        color: colorScheme.primary,
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              log.summary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.25,
                              ),
                            ),
                            SizedBox(height: context.spaceSmall),
                            Wrap(
                              spacing: context.paddingSmall * 0.5,
                              runSpacing: context.paddingSmall * 0.5,
                              children: [
                                _CompactChip(
                                  label: AuditLogLabels.actionLabel(log.action),
                                  color: colorScheme.primary,
                                ),
                                _CompactChip(
                                  label: AuditLogLabels.statusLabel(log.status),
                                  color: statusColor,
                                  icon: log.status == AuditLogStatus.success
                                      ? LucideIcons.checkCircle2
                                      : LucideIcons.xCircle,
                                ),
                              ],
                            ),
                            SizedBox(height: context.spaceSmall),
                            Row(
                              children: [
                                Icon(
                                  LucideIcons.clock,
                                  size: 13,
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.4,
                                  ),
                                ),
                                SizedBox(width: context.paddingSmall * 0.4),
                                Expanded(
                                  child: Text(
                                    _formatDateTime(log.createdAt),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.55,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (footerParts.isNotEmpty) ...[
                              SizedBox(height: context.paddingSmall * 0.5),
                              Text(
                                footerParts.join(' · '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withValues(
                                    alpha: 0.45,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      SizedBox(width: context.paddingSmall * 0.5),
                      Padding(
                        padding: EdgeInsets.only(
                          top: context.paddingSmall * 0.25,
                        ),
                        child: Icon(
                          LucideIcons.chevronRight,
                          size: 18,
                          color: colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _ActionIcon({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}

class _CompactChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const _CompactChip({required this.label, required this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.45,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 11, color: color),
            SizedBox(width: context.paddingSmall * 0.35),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
