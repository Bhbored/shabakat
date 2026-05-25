import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'legend_item.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Revenue Overview',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Dec 2024 – May 2025',
                      style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    LegendItem(color: colorScheme.primary, label: 'Billed'),
                    SizedBox(width: context.paddingSmall),
                    const LegendItem(color: Color(0xFF10B981), label: 'Collected'),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.02),
                borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              ),
              child: Center(
                child: Text(
                  'Revenue Chart Placeholder',
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
