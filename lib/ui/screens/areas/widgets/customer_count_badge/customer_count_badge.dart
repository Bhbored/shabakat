import 'package:flutter/material.dart';

class CustomerCountBadge extends StatelessWidget {
  final int count;

  const CustomerCountBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final label = count == 1 ? 'subscriber' : 'subscribers';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count.toString(),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontFamily: 'JetBrains Mono',
            color: colorScheme.primary,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
