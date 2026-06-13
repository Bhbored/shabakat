import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class PreferenceTile extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  final VoidCallback? onTap;
  final bool labelOnly;

  const PreferenceTile({
    super.key,
    required this.label,
    this.value,
    required this.icon,
    this.onTap,
    this.labelOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final tileHeight = context.screenHeight * 0.08;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final titleStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
    );
    final subtitleStyle = theme.textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.6),
    );

    return SizedBox(
      height: tileHeight,
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: Container(
          padding: EdgeInsets.all(context.paddingSmall),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          ),
          child: Icon(icon, size: 16, color: colorScheme.primary),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: titleStyle),
            if (!labelOnly) ...[
              const SizedBox(height: 2),
              Text(
                value ?? 'Not set',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: subtitleStyle,
              ),
            ],
          ],
        ),
        trailing: Icon(
          LucideIcons.chevronRight,
          size: 16,
          color: colorScheme.onSurface.withValues(alpha: 0.4),
        ),
        onTap: onTap,
      ),
    );
  }
}
