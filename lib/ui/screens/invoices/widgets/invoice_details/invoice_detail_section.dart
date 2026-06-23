import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class InvoiceDetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InvoiceDetailSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: context.spaceSmall),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(context.paddingMedium),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.35),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
