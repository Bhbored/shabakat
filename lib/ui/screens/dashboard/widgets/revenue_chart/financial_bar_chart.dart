import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import 'financial_bar.dart';
import 'negative_bar_segment.dart';
import 'positive_bar_segment.dart';

class FinancialBarChart extends StatelessWidget {
  final List<FinancialBar> bars;

  const FinancialBarChart({super.key, required this.bars});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final maxPositive = bars
        .where((bar) => bar.value > 0)
        .fold(0.0, (max, bar) => bar.value > max ? bar.value : max);
    final maxNegative = bars
        .where((bar) => bar.value < 0)
        .fold(0.0, (min, bar) => bar.value < min ? bar.value : min)
        .abs();
    final hasNegative = maxNegative > 0;

    final chartHeight = context.screenHeight * 0.22;
    final barWidth = context.screenWidth / bars.length * 0.32;
    final labelReserve = context.spaceMedium;
    final dividerHeight = context.screenHeight * 0.001;
    final drawableHeight =
        hasNegative ? chartHeight - dividerHeight : chartHeight;
    final positiveHeight = hasNegative
        ? drawableHeight * (maxPositive / (maxPositive + maxNegative))
        : chartHeight;
    final negativeHeight = hasNegative ? drawableHeight - positiveHeight : 0.0;

    return Column(
      children: [
        SizedBox(
          height: chartHeight,
          child: Column(
            children: [
              if (hasNegative)
                SizedBox(
                  height: negativeHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (final bar in bars)
                        Expanded(
                          child: NegativeBarSegment(
                            bar: bar,
                            maxNegative: maxNegative,
                            segmentHeight: negativeHeight,
                            barWidth: barWidth,
                            labelReserve: labelReserve,
                          ),
                        ),
                    ],
                  ),
                ),
              if (hasNegative)
                Divider(
                  height: dividerHeight,
                  thickness: dividerHeight,
                  color: colorScheme.outline.withValues(alpha: 0.6),
                ),
              SizedBox(
                height: positiveHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final bar in bars)
                      Expanded(
                        child: PositiveBarSegment(
                          bar: bar,
                          maxPositive: maxPositive,
                          segmentHeight: positiveHeight,
                          barWidth: barWidth,
                          labelReserve: labelReserve,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.spaceSmall),
        Row(
          children: [
            for (final bar in bars)
              Expanded(
                child: Text(
                  bar.label,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.55),
                    fontSize: (theme.textTheme.bodySmall?.fontSize ?? 12) * 0.9,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
