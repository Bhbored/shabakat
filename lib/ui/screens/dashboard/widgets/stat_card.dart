import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String trend;
  final IconData icon;
  final Color? iconColor;
  final Color? trendColor;
  final bool isAccent;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.trend,
    required this.icon,
    this.iconColor,
    this.trendColor,
    this.isAccent = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: isAccent
                        ? colorScheme.onPrimary.withValues(alpha: 0.6)
                        : colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(context.paddingSmall),
                decoration: BoxDecoration(
                  color: isAccent
                      ? colorScheme.onPrimary.withValues(alpha: 0.1)
                      : (iconColor ?? colorScheme.primary).withValues(
                          alpha: 0.1,
                        ),
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color: isAccent
                      ? colorScheme.onPrimary
                      : (iconColor ?? colorScheme.primary),
                ),
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
          SizedBox(height: context.spaceSmall),
          Text(
            trend,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isAccent
                  ? colorScheme.onPrimary.withValues(alpha: 0.55)
                  : (trendColor ?? AppColors.success),
            ),
          ),
        ],
      ),
    );
  }
}
