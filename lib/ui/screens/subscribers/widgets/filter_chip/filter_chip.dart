import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class StatusFilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const StatusFilterChip({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.paddingSmall, vertical: context.paddingSmall * 0.75),
        decoration: BoxDecoration(
          color: isActive ? theme.primaryColor : colorScheme.surface,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          border: Border.all(
            color: isActive ? theme.primaryColor : colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: isActive ? theme.primaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white : colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
