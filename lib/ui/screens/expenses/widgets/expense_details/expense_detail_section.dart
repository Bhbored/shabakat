import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class ExpenseDetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ExpenseDetailSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: context.spaceSmall),
            ...children,
          ],
        ),
      ),
    );
  }
}
