import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class AreaDetailStatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AreaDetailStatChip({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.75,
      ),
      decoration: ControlsThemes.statChipDecoration(colorScheme),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 18, color: colorScheme.primary),
          SizedBox(width: context.paddingSmall * 0.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: context.spaceSmall * 0.5),
              Text(
                value,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
