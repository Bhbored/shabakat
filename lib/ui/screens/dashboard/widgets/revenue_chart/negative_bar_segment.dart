import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import 'financial_bar.dart';
import 'financial_chart_formatters.dart';

class NegativeBarSegment extends StatelessWidget {
  final FinancialBar bar;
  final double maxNegative;
  final double segmentHeight;
  final double barWidth;
  final double labelReserve;

  const NegativeBarSegment({
    super.key,
    required this.bar,
    required this.maxNegative,
    required this.segmentHeight,
    required this.barWidth,
    required this.labelReserve,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (bar.value >= 0) {
      return const SizedBox.shrink();
    }

    final drawableHeight =
        (segmentHeight - labelReserve).clamp(0.0, segmentHeight);
    final barHeight = maxNegative == 0
        ? 0.0
        : (bar.value.abs() / maxNegative) * drawableHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          formatCompactFinancialValue(bar.value),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: 'JetBrains Mono',
            fontSize: (theme.textTheme.labelSmall?.fontSize ?? 12) * 0.85,
          ),
        ),
        SizedBox(height: context.spaceSmall * 0.25),
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: bar.color,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(context.borderRadiusMedium * 0.35),
            ),
          ),
        ),
      ],
    );
  }
}
