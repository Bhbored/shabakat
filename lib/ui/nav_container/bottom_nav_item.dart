import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = isActive
        ? theme.primaryColor
        : colorScheme.onSurface.withValues(alpha: 0.6);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.spaceSmall),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: context.screenWidth * 0.065,
                shadows: isActive
                    ? [
                        Shadow(
                          color: theme.primaryColor.withValues(alpha: 0.7),
                          blurRadius: context.screenWidth * 0.015,
                        ),
                      ]
                    : null,
              ),
              SizedBox(height: context.spaceSmall / 2),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
