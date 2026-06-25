import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SubscriberSuspendErrorContent extends StatelessWidget {
  final String message;

  const SubscriberSuspendErrorContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(LucideIcons.alertCircle, size: 48, color: colorScheme.error),
        SizedBox(height: context.spaceMedium),
        Text(
          message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.error,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
