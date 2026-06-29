import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';

class AuditLogDetailsContextGrid extends StatelessWidget {
  final AuditLog log;

  const AuditLogDetailsContextGrid({super.key, required this.log});

  String _formatDateTime(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$day/$month/${date.year} · $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final items = <_AuditLogContextItem>[
      _AuditLogContextItem(
        icon: LucideIcons.clock,
        label: 'When',
        value: _formatDateTime(log.createdAt),
      ),
      if (log.userEmail != null && log.userEmail!.trim().isNotEmpty)
        _AuditLogContextItem(
          icon: LucideIcons.user,
          label: 'By',
          value: log.userEmail!.trim(),
        ),
      if (log.entityId != null && log.entityId!.isNotEmpty)
        _AuditLogContextItem(
          icon: LucideIcons.hash,
          label: 'Entity ID',
          value: log.entityId!,
        ),
      _AuditLogContextItem(
        icon: LucideIcons.fingerprint,
        label: 'Log ID',
        value: log.id,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: context.paddingSmall * 0.5,
        mainAxisSpacing: context.paddingSmall * 0.5,
        childAspectRatio: 2.35,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          _AuditLogContextTile(item: items[index]),
    );
  }
}

class _AuditLogContextItem {
  final IconData icon;
  final String label;
  final String value;

  const _AuditLogContextItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class _AuditLogContextTile extends StatelessWidget {
  final _AuditLogContextItem item;

  const _AuditLogContextTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: ControlsThemes.statChipDecoration(colorScheme),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingSmall,
          vertical: context.paddingSmall * 0.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(item.icon, size: 12, color: colorScheme.primary),
                SizedBox(width: context.paddingSmall * 0.35),
                Expanded(
                  child: Text(
                    item.label.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: colorScheme.onSurface.withValues(alpha: 0.45),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.paddingSmall * 0.35),
            SelectableText(
              item.value,
              maxLines: 2,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
