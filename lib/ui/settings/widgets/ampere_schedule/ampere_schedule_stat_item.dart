import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AmpereScheduleStatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AmpereScheduleStatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Icon(
          icon,
          size: 18,
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        SizedBox(height: context.spaceSmall),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
