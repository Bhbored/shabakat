import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class ExpenseSummaryTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isAccent;

  const ExpenseSummaryTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isAccent = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final mutedColor = isAccent
        ? colorScheme.onPrimary.withValues(alpha: 0.6)
        : colorScheme.onSurface.withValues(alpha: 0.5);
    final iconColor = isAccent ? colorScheme.onPrimary : colorScheme.primary;

    return Container(
      padding: EdgeInsets.all(context.paddingMedium),
      decoration: ControlsThemes.statCardDecoration(
        colorScheme,
        isAccent: isAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: mutedColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(context.paddingSmall * 0.75),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
              color: isAccent ? colorScheme.onPrimary : colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
