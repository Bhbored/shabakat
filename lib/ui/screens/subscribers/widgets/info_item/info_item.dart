import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final List<String> values;
  final bool isBold;

  const InfoItem({
    super.key,
    required this.label,
    required this.values,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final valueStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
      color: isBold ? colorScheme.primary : colorScheme.onSurface,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: context.spaceSmall * 0.25),
        for (var i = 0; i < values.length; i++) ...[
          if (i > 0) SizedBox(height: context.spaceSmall * 0.25),
          Text(values[i], style: valueStyle),
        ],
      ],
    );
  }
}
