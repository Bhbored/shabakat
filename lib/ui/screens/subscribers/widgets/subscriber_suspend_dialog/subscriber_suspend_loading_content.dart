import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SubscriberSuspendLoadingContent extends StatelessWidget {
  const SubscriberSuspendLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(strokeWidth: 2.5),
        ),
        SizedBox(height: context.spaceMedium),
        Text(
          'Suspending subscribers...',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
