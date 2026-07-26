import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class OfflineTabPlaceholder extends StatelessWidget {
  final String title;
  final IconData icon;

  const OfflineTabPlaceholder({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: context.screenWidth * 0.14,
              color: colorScheme.onSurface.withValues(alpha: 0.35),
            ),
            SizedBox(height: context.spaceMedium),
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
