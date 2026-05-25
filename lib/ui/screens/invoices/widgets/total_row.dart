import 'package:flutter/material.dart';

class TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const TotalRow({
    super.key,
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)
              : theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
        ),
        Text(
          value,
          style: isTotal
              ? theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'JetBrains Mono',
                  color: colorScheme.primary,
                )
              : theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'JetBrains Mono',
                ),
        ),
      ],
    );
  }
}
