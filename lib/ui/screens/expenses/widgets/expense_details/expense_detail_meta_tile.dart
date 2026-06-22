import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class ExpenseDetailMetaTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const ExpenseDetailMetaTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(context.paddingMedium),
      decoration: ControlsThemes.statCardDecoration(colorScheme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(context.paddingSmall * 0.75),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                ),
                child: Icon(icon, size: 14, color: colorScheme.primary),
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
            ),
          ),
        ],
      ),
    );
  }
}
