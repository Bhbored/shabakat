import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final bool isMono;

  const InfoItem({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
    this.isMono = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontFamily: isMono ? 'JetBrains Mono' : null,
            color: isBold ? theme.primaryColor : colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
