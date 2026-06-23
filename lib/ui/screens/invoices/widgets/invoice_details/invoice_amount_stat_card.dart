import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class InvoiceAmountStatCard extends StatelessWidget {
  final String label;
  final double value;
  final IconData icon;
  final Color accentColor;
  final bool emphasize;

  const InvoiceAmountStatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.accentColor,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(context.paddingSmall),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: emphasize ? 0.14 : 0.08),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        border: Border.all(
          color: accentColor.withValues(alpha: emphasize ? 0.45 : 0.22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: accentColor),
          SizedBox(height: context.spaceSmall * 0.5),
          Text(
            label.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(height: context.spaceSmall * 0.25),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
              color: emphasize ? accentColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
